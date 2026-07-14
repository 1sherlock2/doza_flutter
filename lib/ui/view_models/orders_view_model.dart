import 'package:doza_flutter/data/repositories/orders/orders_repository.dart';
import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
import 'package:flutter/material.dart';

class OrdersViewModel extends ChangeNotifier {
  OrdersViewModel({required OrdersRepository ordersRepository})
      : _ordersRepository = ordersRepository {
    refreshOrders();
  }

  final OrdersRepository _ordersRepository;

  List<OrdersListApiModel> _orders = [];
  List<OrdersListApiModel> get orders => _orders;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> refreshOrders() async {
    _isLoading = true;
    notifyListeners();

    final result = await _ordersRepository.getOrders();
    _orders = result;

    _isLoading = false;
    notifyListeners();
  }
}
