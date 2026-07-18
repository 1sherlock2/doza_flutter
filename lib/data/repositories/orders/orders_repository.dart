import 'package:doza_flutter/data/services/models/changes_order_status/changes_order_status.dart';
import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/models/order_info_ui_model.dart';

abstract class OrdersRepository {
  Future<void> initOrdersChanges();
  Stream<List<OrdersListApiModel>> get getOrdersChanges;
  Future<String?> createOrder({required OrderInfoUiModel combinedOrderInfo});
  Future<List<OrdersListApiModel>> fetchOrders();
  Stream<ChangesOrderStatus> get changeOrderStatus;
}
