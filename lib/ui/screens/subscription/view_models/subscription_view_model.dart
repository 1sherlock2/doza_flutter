import 'dart:async';

import 'package:doza_flutter/data/repositories/subscription/subscription_repository.dart';
import 'package:doza_flutter/data/services/auth_state_notifier.dart';
import 'package:doza_flutter/data/services/models/subscription/subscription_plan_model.dart';
import 'package:doza_flutter/data/services/models/subscription/subscription_status_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum SubscriptionViewState { idle, loading, error }

class SubscriptionViewModel extends ChangeNotifier with WidgetsBindingObserver {
  SubscriptionViewModel({
    required SubscriptionRepository subscriptionRepository,
    required AuthStateNotifier authStateNotifier,
  }) : _repo = subscriptionRepository,
       _authStateNotifier = authStateNotifier {
    _init();
  }

  static const _pollingInterval = Duration(seconds: 3);
  static const _maxPollingAttempts = 10;

  final SubscriptionRepository _repo;
  final AuthStateNotifier _authStateNotifier;

  bool _awaitingPaymentReturn = false;

  Timer? _pollingTimer;
  int _pollingAttempt = 0;
  bool _isPollingPayment = false;
  bool get isPollingPayment => _isPollingPayment;
  bool _pollingInProgress = false;

  SubscriptionViewState _state = SubscriptionViewState.loading;
  SubscriptionViewState get state => _state;

  List<SubscriptionPlanModel> _plans = [];
  List<SubscriptionPlanModel> get plans => _plans;

  SubscriptionStatusModel? _status;
  SubscriptionStatusModel? get status => _status;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _paymentUrl;
  bool _isCreatingPayment = false;
  bool get isCreatingPayment => _isCreatingPayment;

  int? _selectedPlanId;
  int? get selectedPlanId => _selectedPlanId;

  String _selectedPaymentMethod = 'bank_card'; // 'bank_card' | 'sbp'
  String get selectedPaymentMethod => _selectedPaymentMethod;

  Future<void> _init() async {
    WidgetsBinding.instance.addObserver(this);
    await refresh();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _awaitingPaymentReturn) {
      _awaitingPaymentReturn = false;
      _startPaymentPolling();
    }
  }

  Future<void> refresh() async {
    _state = SubscriptionViewState.loading;
    _errorMessage = null;
    notifyListeners();

    final plansResult = await _repo.getPlans();
    final statusResult = await _repo.getStatus();

    plansResult.fold((plans) {
      _plans = plans;
      if (_selectedPlanId == null && plans.isNotEmpty) {
        _selectedPlanId = plans.first.id;
      }
    }, (error) => _errorMessage = error.toString());

    statusResult.fold((status) {
      _status = status;
      // Если подписка стала активной пока пользователь был принудительно
      // направлен на этот экран (402 или showSubscriptionBackButton),
      // уведомляем notifier — роутер перенаправит на home.
      if (status.hasActiveSubscription &&
          (_authStateNotifier.isSubscriptionRequired ||
              _authStateNotifier.showSubscriptionBackButton)) {
        _authStateNotifier.subscriptionActivated();
      }
    }, (_) {});

    _state = SubscriptionViewState.idle;
    notifyListeners();
  }

  void selectPlan(int planId) {
    _selectedPlanId = planId;
    _errorMessage = null;
    notifyListeners();
  }

  void selectPaymentMethod(String method) {
    _selectedPaymentMethod = method;
    notifyListeners();
  }

  Future<void> subscribe(int planId) async {
    if (_isCreatingPayment || _selectedPlanId == null) return;
    _isCreatingPayment = true;
    _errorMessage = null;
    notifyListeners();

    // Передаём способ оплаты напрямую при создании подписки
    final result = await _repo.createSubscription(
      _selectedPlanId!,
      _selectedPaymentMethod,
    );
    result.fold(
      (url) => _paymentUrl = url,
      (error) => _errorMessage = error.toString(),
    );

    _isCreatingPayment = false;
    notifyListeners();

    if (_paymentUrl != null) {
      await _openPaymentUrl(_paymentUrl!);
      _paymentUrl = null;
    }
  }

  Future<void> checkStatus() async {
    final result = await _repo.getStatus();
    result.fold((status) {
      _status = status;
      if (status.hasActiveSubscription) {
        _authStateNotifier.subscriptionActivated();
      }
    }, (_) {});
    notifyListeners();
  }

  void _startPaymentPolling() {
    _stopPolling();
    _pollingAttempt = 0;
    _isPollingPayment = true;
    notifyListeners();

    _pollingTimer = Timer.periodic(_pollingInterval, (_) async {
      // Защита от параллельных тиков: если предыдущий запрос ещё не завершён — пропускаем
      if (!_isPollingPayment || _pollingInProgress) return;
      _pollingInProgress = true;

      try {
        _pollingAttempt++;
        final result = await _repo.getStatus();

        // Polling мог быть остановлен пока выполнялся await — не обрабатываем результат
        if (!_isPollingPayment) return;

        result.fold(
          (status) {
            _status = status;
            if (status.hasActiveSubscription) {
              _authStateNotifier.subscriptionActivated();
              _stopPolling();
            } else if (_pollingAttempt >= _maxPollingAttempts) {
              _stopPolling();
            }
          },
          (_) {
            if (_pollingAttempt >= _maxPollingAttempts) {
              _stopPolling();
            }
          },
        );
        notifyListeners();
      } finally {
        _pollingInProgress = false;
      }
    });
  }

  void _stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
    _isPollingPayment = false;
    _pollingInProgress = false;
  }

  /// Ручная проверка статуса оплаты — запускает новый цикл polling
  void retryCheckStatus() {
    _startPaymentPolling();
  }

  Future<void> _openPaymentUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      _awaitingPaymentReturn = true;
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  void dispose() {
    _stopPolling();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
