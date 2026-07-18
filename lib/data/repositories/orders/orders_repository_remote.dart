import 'dart:async';
import 'dart:io';

import 'package:doza_flutter/data/repositories/orders/orders_repository.dart';
import 'package:doza_flutter/data/services/api_client.dart';
import 'package:doza_flutter/data/services/models/changes_order_status/changes_order_status.dart';
import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/models/order_info_ui_model.dart';
import 'package:logging/logging.dart';
import 'package:socket_io_client/socket_io_client.dart' as client_socket;

class OrdersRepositoryRemote implements OrdersRepository {
  OrdersRepositoryRemote({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;
  final _log = Logger('OrdersRepositoryRemote');

  client_socket.Socket? _ordersSocket;

  final _ordersSocketController =
      StreamController<List<OrdersListApiModel>>.broadcast();
  @override
  Stream<List<OrdersListApiModel>> get getOrdersChanges =>
      _ordersSocketController.stream;

  final _changesOrderStatus = StreamController<ChangesOrderStatus>.broadcast();
  @override
  Stream<ChangesOrderStatus> get changeOrderStatus =>
      _changesOrderStatus.stream;

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
  Future<List<OrdersListApiModel>> fetchOrders() async {
    try {
      final result = await _apiClient.getOrdersApi();
      return result.getOrThrow();
    } catch (e) {
      _log.warning('Error fetching orders via HTTP: $e');
      return [];
    }
  }

  @override
  Future<void> initOrdersChanges() async {
    final String eventPath = 'events/orders/all';
    final String paymentPath = 'events/order/payment';

    if (_ordersSocket != null) return;

    final socket = await _apiClient.getSocket();

    if (socket == null) {
      throw SocketException('Socket is not found');
    }

    _ordersSocket = socket;

    _ordersSocket!.on(eventPath, (data) {
      try {
        if (data is List<dynamic>) {
          final ordersResponse = data
              .map((orderItem) => OrdersListApiModel.fromJson(orderItem))
              .toList();
          _ordersSocketController.add(ordersResponse);
        }
      } catch (error) {
        _log.warning('Error handle $eventPath data $error');
      }
    });

    _ordersSocket!.on(paymentPath, (data) {
      try {
        if (data is Map<String, dynamic>) {
          final actualStatus = ChangesOrderStatus.fromJson(data);
          _changesOrderStatus.add(actualStatus);
        }
      } catch (error) {
        _log.warning('Error handle $paymentPath data $error');
      }
    });

    if (_ordersSocket!.connected) {
      _log.info('✅ Socket already connected, subscribing...');
      _ordersSocket!.emit(eventPath);
    }

    _ordersSocket!.onConnect((_) {
      _log.info('✅ events/orders/all connected');
      _ordersSocket!.emit(eventPath);
    });

    _ordersSocket!.onDisconnect((_) {
      _log.info('🔴 $eventPath disconnected');
    });
  }
}
