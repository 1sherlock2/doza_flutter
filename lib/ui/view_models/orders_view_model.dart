import 'dart:async';

import 'package:doza_flutter/data/repositories/orders/orders_repository.dart';
import 'package:doza_flutter/data/services/models/changes_order_status/changes_order_status.dart';
import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
import 'package:doza_flutter/enums/payment_status.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OrdersViewModel extends ChangeNotifier {
  OrdersViewModel({required OrdersRepository ordersRepository})
      : _ordersRepository = ordersRepository {
    _ordersRepository.initOrdersChanges();
    _ordersChangesController =
        _ordersRepository.getOrdersChanges.listen(handleChangesOrders);
    _changesOrderStatusController =
        ordersRepository.changeOrderStatus.listen(handleChangesOrderStatus);
  }

  final OrdersRepository _ordersRepository;

  late final StreamSubscription<List<OrdersListApiModel>>
      _ordersChangesController;

  late final StreamSubscription<ChangesOrderStatus>
      _changesOrderStatusController;

  List<OrdersListApiModel> _orders = [];
  List<OrdersListApiModel> get orders => _orders;

  void handleChangesOrderStatus(ChangesOrderStatus data) {
    final index = _orders.indexWhere((order) => order.id == data.orderId);
    if (index != -1) {
      _orders[index] = _orders[index]
          .copyWith(status: PaymentStatus.fromString(data.status));
    }
    notifyListeners();
  }

  Future<void> openPaymentLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: await supportsLaunchMode(LaunchMode.inAppWebView)
            ? LaunchMode.inAppBrowserView
            : LaunchMode.externalApplication,
      );
    }
  }

  void handleChangesOrders(List<OrdersListApiModel> orders) {
    _orders = orders;
    notifyListeners();
  }

  Future<void> refreshOrders() async {
    final orders = await _ordersRepository.fetchOrders();
    if (orders.isNotEmpty) {
      _orders = orders;
      notifyListeners();
    }
  }

  // @override
  // void dispose() {
  //   _ordersChangesController.cancel();
  //   super.dispose();
  // }
}
