import 'package:doza_flutter/data/repositories/cart/cart_repository.dart';
import 'package:doza_flutter/data/repositories/orders/orders_repository.dart';
import 'package:doza_flutter/data/services/models/cart_item/cart_item_api_model.dart';
import 'package:doza_flutter/data/services/models/city_delivery/city_delivery_api_model.dart';
import 'package:doza_flutter/data/services/subscription_state_notifier.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/models/additional_order_info_ui_model.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/models/order_info_ui_model.dart';
import 'package:doza_flutter/ui/view_models/cart_state_notifier.dart';
import 'package:doza_flutter/ui/view_models/orders_view_model.dart';
import 'package:doza_flutter/ui/view_models/user_info_view_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AdditionalPaymentInfoViewModel extends ChangeNotifier
    with WidgetsBindingObserver {
  AdditionalPaymentInfoViewModel(
      {required SubscriptionStateNotifier subscriptionStateNotifier,
      required CartRepository cartRepository,
      required OrdersRepository ordersRepository,
      required CartStateNotifier cartStateNotifier,
      required UserInfoViewModel userInfoViewModel,
      required OrdersViewModel ordersViewModel})
      : _cartRepository = cartRepository,
        _ordersRepository = ordersRepository,
        _cartStateNotifier = cartStateNotifier,
        _subscriptionStateNotifier = subscriptionStateNotifier,
        _userInfoViewModel = userInfoViewModel,
        _ordersViewModel = ordersViewModel {
    WidgetsBinding.instance.addObserver(this);
    userInfoViewModel.addListener(_onUserInfoChanged);
  }

  final OrdersRepository _ordersRepository;
  final SubscriptionStateNotifier _subscriptionStateNotifier;
  final CartRepository _cartRepository;
  final CartStateNotifier _cartStateNotifier;
  final UserInfoViewModel _userInfoViewModel;
  final OrdersViewModel _ordersViewModel;

  List<CartItemApiModel> _selectedCartItems = [];
  List<CartItemApiModel> get selectedCartItems => _selectedCartItems;

  List<CityDeliveryApiModel> _cityDelivery = [];
  List<CityDeliveryApiModel> get cityDelivery => _cityDelivery;

  int _productsPrice = 0;
  int get productsPrice => _productsPrice;

  int _deliveryPrice = 0;
  int get deliveryPrice => _deliveryPrice;

  bool _isSpendBonuses = false;
  bool get isSpendBonuses => _isSpendBonuses;

  String _selectedPaymentMethod = 'bank_card'; // 'bank_card' | 'sbp'
  String get selectedPaymentMethod => _selectedPaymentMethod;

  void selectPaymentMethod(String method) {
    _selectedPaymentMethod = method;

    notifyListeners();
  }

  int get bonusBalance {
    int price = _userInfoViewModel.userBonuses.balance;
    if (_isSpendBonuses) {
      price -= spendBonuses;
    }
    return price;
  }

  int get subscriptionPrecent => _subscriptionStateNotifier.discountPercent;

  int get subscriptionDiscount =>
      (_productsPrice * _subscriptionStateNotifier.discountPercent) ~/ 100;

  int get spendBonuses {
    return (productsPrice * _userInfoViewModel.userBonuses.bonusPercent) ~/ 100;
  }

  bool _hasSubscription = false;
  bool get hasSubscription => _hasSubscription;

  bool _isCreatingPayment = false;
  bool get isCreatingPayment => _isCreatingPayment;

  bool _awaitingPaymentReturn = false;
  bool get awaitingPaymentReturn => _awaitingPaymentReturn;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _awaitingPaymentReturn) {
      _awaitingPaymentReturn = false;
      _isCreatingPayment = false;
      notifyListeners();
    }
  }

  void _onUserInfoChanged() {
    _hasSubscription = _userInfoViewModel.hasSubscription;
    notifyListeners();
  }

  void changeSpendBonuses(bool? newValue) {
    _isSpendBonuses = newValue!;
    notifyListeners();
  }

  int get totalPrice {
    int totalPrice = _productsPrice + _deliveryPrice;
    if (_userInfoViewModel.hasSubscription) {
      totalPrice -=
          (_productsPrice * _subscriptionStateNotifier.discountPercent) ~/ 100;
      return totalPrice;
    }

    if (_isSpendBonuses) {
      totalPrice -=
          (_productsPrice * _userInfoViewModel.userBonuses.bonusPercent) ~/ 100;
    }
    return totalPrice;
  }

  bool _errorByCreateOrder = false;
  bool get errorByCreateOrder => _errorByCreateOrder;

  void sendOrderInfo(AdditionalOrderInfoUiModel additionalOrderInfo) async {
    _errorByCreateOrder = false;
    notifyListeners();
    final AdditionalOrderInfoUiModel(
      :secondName,
      :firstName,
      :city,
      :street,
      :house,
      :apartment,
    ) = additionalOrderInfo;

    final combinedOrderInfo = OrderInfoUiModel(
        city: city,
        firstName: firstName,
        house: house,
        secondName: secondName,
        street: street,
        apartment: apartment,
        paymentMethod: _selectedPaymentMethod,
        orderItems: _selectedCartItems);

    final url = await _ordersRepository.createOrder(
        combinedOrderInfo: combinedOrderInfo);

    if (url == null) {
      _errorByCreateOrder = true;
      notifyListeners();
      return;
    }

    _ordersViewModel.refreshOrders();

    _isCreatingPayment = true;
    notifyListeners();

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      _awaitingPaymentReturn = true;
      await launchUrl(
        uri,
        mode: await supportsLaunchMode(LaunchMode.inAppWebView)
            ? LaunchMode.inAppBrowserView
            : LaunchMode.externalApplication,
      );
    }
  }

  void selectedDeliveryCity(int cityId) {
    final findDeliveryPrice = _cityDelivery
        .firstWhere((cityItem) => cityItem.id == cityId)
        .deliveryCost;
    _deliveryPrice = findDeliveryPrice;
    notifyListeners();
  }

  Future<void>? getSelectedCartItems() async {
    if (_cartStateNotifier.selectedCartByPayment.isEmpty) return;
    final response = await _cartRepository.getCartElements(
        selectedIds: _cartStateNotifier.selectedCartByPayment);
    _selectedCartItems = response;
    final totalPrice = _selectedCartItems.fold(
        0, (summ, item) => summ + (item.price * item.quantity));
    _productsPrice = totalPrice;
    notifyListeners();
  }

  Future<void> getCityDelivery() async {
    final response = await _cartRepository.getCityDelivery();

    _cityDelivery = response;
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _userInfoViewModel.removeListener(_onUserInfoChanged);
    super.dispose();
  }
}
