import 'package:dio/dio.dart';
import 'package:doza_flutter/data/services/models/subscription/subscription_status_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';
import 'package:result_dart/result_dart.dart';

class ApiClient {
  ApiClient(this._dio);

  final Logger _log = Logger('ApiClient');
  final Dio _dio; // внутренний сервер — с AuthInterceptor

  final String _host = dotenv.env['SERVER_IP'] ?? '10.0.2.2';
  final int _port = dotenv.env['SERVER_PORT'] != null
      ? (int.tryParse(dotenv.env['SERVER_PORT']!) ?? 6000)
      : 4000;

  String get _baseUrl => 'http://$_host:$_port';

  Failure<T, Exception> formatExceptionFailure<T extends Object>(
    Object error,
  ) => Failure<T, Exception>(FormatException('Failed to parse $error'));

  AsyncResult<SubscriptionStatusModel> getSubscriptionStatus() async {
    try {
      final response = await _dio.get('$_baseUrl/subscriptions/status');
      try {
        return Success(
          SubscriptionStatusModel.fromJson(
            response.data as Map<String, dynamic>,
          ),
        );
      } catch (error) {
        return formatExceptionFailure<SubscriptionStatusModel>(error);
      }
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      return Failure(FormatException('Failed to query $error'));
    }
  }
}
