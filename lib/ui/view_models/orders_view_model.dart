import 'dart:async';

import 'package:doza_flutter/data/repositories/orders/orders_repository.dart';
import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
import 'package:flutter/material.dart';

class OrdersViewModel extends ChangeNotifier {
  OrdersViewModel({required OrdersRepository ordersRepository})
      : _ordersRepository = ordersRepository {
    _ordersRepository.initOrdersChanges();
    _ordersChangesController =
        _ordersRepository.getOrdersChanges.listen(handleChangesOrders);
  }

  final OrdersRepository _ordersRepository;

  late final StreamSubscription<List<OrdersListApiModel>>
      _ordersChangesController;

  List<OrdersListApiModel> _orders = [];
  List<OrdersListApiModel> get orders => _orders;

  void handleChangesOrders(List<OrdersListApiModel> orders) {
    _orders = orders;
    notifyListeners();
  }

  @override
  void dispose() {
    _ordersChangesController.cancel();
    super.dispose();
  }
}
