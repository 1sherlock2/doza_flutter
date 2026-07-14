import 'package:doza_flutter/data/repositories/orders/orders_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/models/order_info_ui_model.dart';
import 'package:logging/logging.dart';

class OrdersRepositoryRemote implements OrdersRepository {
  OrdersRepositoryRemote({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;
  final _log = Logger('OrdersRepositoryRemote');

  @override
  Future<String?> createOrder(
      {required OrderInfoUiModel combinedOrderInfo}) async {
    try {
      final confirmatiomUrl =
          await _apiClient.createOrderApi(combinedOrderInfo);
      return confirmatiomUrl.getOrThrow();
    } catch (e) {
      _log.warning('Error $e');
      return null;
    }
  }

  @override
  Future<List<OrdersListApiModel>> getOrders() async {
    try {
      final response = await _apiClient.getOrdersApi();
      if (response.isError()) {
        _log.warning('Error get all orders ${response.exceptionOrNull()}');
      }
      return response.getOrThrow();
    } catch (e) {
      _log.warning('Error: $e');
      return [];
    }
  }
}
