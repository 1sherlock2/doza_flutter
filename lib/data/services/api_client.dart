import 'package:dio/dio.dart';
import 'package:doza_flutter/data/services/models/cart_item/cart_item_api_model.dart';
import 'package:doza_flutter/data/services/models/categories/categories_api_model.dart';
import 'package:doza_flutter/data/services/models/favorites_products/favorites_products_api_model.dart';
import 'package:doza_flutter/data/services/models/product_details/product_details_api_model.dart';
import 'package:doza_flutter/data/services/models/products/products_api_model.dart';
import 'package:doza_flutter/data/services/models/subscription/subscription_plan_model.dart';
import 'package:doza_flutter/data/services/models/subscription/subscription_status_model.dart';
import 'package:doza_flutter/data/services/models/user_favorites/user_favorites_api_model.dart';
import 'package:doza_flutter/ui/screens/product_details/models/card_item_request.dart';
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
  ) =>
      Failure<T, Exception>(FormatException('Failed to parse $error'));

  // ─── Subscription endpoints ───────────────────────────────────────────────
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

  AsyncResult<List<SubscriptionPlanModel>> getSubscriptionPlans() async {
    try {
      final response = await _dio.get('$_baseUrl/subscriptions/plans');
      try {
        final list = response.data as List<dynamic>;
        return Success(
          list
              .map(
                (e) =>
                    SubscriptionPlanModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        );
      } catch (error) {
        return formatExceptionFailure<List<SubscriptionPlanModel>>(error);
      }
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      return Failure(FormatException('Failed to query $error'));
    }
  }

  /// Создаёт подписку на сервере. Возвращает confirmation_url для открытия в браузере.
  AsyncResult<String> createSubscription(
    int planId,
    String paymentMethod,
  ) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/subscriptions/create',
        data: {'planId': planId, 'paymentMethod': paymentMethod},
      );
      final url =
          (response.data as Map<String, dynamic>)['confirmationUrl'] as String?;
      if (url == null) {
        return Failure(Exception('No confirmationUrl in response'));
      }
      return Success(url);
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      return Failure(FormatException('Failed to query $error'));
    }
  }

  AsyncResult<List<CategoriesApiModel>> getCategoriesApi() async {
    try {
      final response = await _dio.get('$_baseUrl/categories');
      try {
        final list = response.data as List<dynamic>;
        return Success(list
            .map((e) => CategoriesApiModel.fromJson(e as Map<String, dynamic>))
            .toList());
      } catch (error) {
        return formatExceptionFailure<List<CategoriesApiModel>>(error);
      }
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      throw FormatException('Failed to query $error');
    }
  }

  AsyncResult<List<ProductsApiModel>> getProductsApi() async {
    try {
      final response = await _dio.get('$_baseUrl/products');
      try {
        final list = response.data as List<dynamic>;
        return Success(list
            .map((e) => ProductsApiModel.fromJson(e as Map<String, dynamic>))
            .toList());
      } catch (error) {
        return formatExceptionFailure<List<ProductsApiModel>>(error);
      }
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      throw FormatException('Failed to query $error');
    }
  }

  AsyncResult<List<int>> getFavoritesApi() async {
    try {
      final response = await _dio.get('$_baseUrl/user-favorites');

      final list = response.data as List<dynamic>;
      return Success(list.cast<int>().toList());
    } on DioException catch (error) {
      return formatExceptionFailure<List<int>>(error);
    } catch (error) {
      throw FormatException('Failed to query $error');
    }
  }

  AsyncResult<List<UserFavoritesApiModel>> toggleFavoritesApi(
      int productId) async {
    try {
      final response = await _dio
          .post('$_baseUrl/user-favorites', data: {'productId': productId});
      final list = response.data as List<dynamic>;
      return Success(list
          .map((e) => UserFavoritesApiModel.fromJson(e as Map<String, dynamic>))
          .toList());
    } on DioException catch (error) {
      return formatExceptionFailure<List<UserFavoritesApiModel>>(error);
    } catch (error) {
      throw FormatException('Failed to query $error');
    }
  }

  AsyncResult<List<FavoritesProductsApiModel>> getFavoritesProductsApi() async {
    try {
      final response = await _dio.get('$_baseUrl/user-favorites/products');
      final list = response.data as List<dynamic>;
      return Success(list
          .map((e) =>
              FavoritesProductsApiModel.fromJson(e as Map<String, dynamic>))
          .toList());
    } on DioException catch (error) {
      return formatExceptionFailure<List<FavoritesProductsApiModel>>(error);
    } catch (error) {
      throw FormatException('Failed to query $error');
    }
  }

  AsyncResult<ProductDetailsApiModel> getProductDetails(
      String productId) async {
    try {
      final response = await _dio.get('$_baseUrl/product-details/$productId');
      final responseData = response.data as Map<String, dynamic>;
      final serialazableResponse =
          ProductDetailsApiModel.fromJson(responseData);
      return Success(serialazableResponse);
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      throw FormatException('Failed to query $error');
    }
  }

  // ─── Cart endpoints ───────────────────────────────────────────────
  AsyncResult<bool> addToCart(List<CardItemRequest> cartItems) async {
    try {
      final response =
          await _dio.post('$_baseUrl/cart', data: {'cartItems': cartItems});
      final isSuccess = response.statusCode == 201;
      return Success(isSuccess);
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      throw FormatException('Failed to query $error');
    }
  }

  AsyncResult<List<CartItemApiModel>> getCartItems() async {
    try {
      final response = await _dio.get('$_baseUrl/cart');
      final responseData = response.data as List<dynamic>;
      return Success(
          responseData.map((item) => CartItemApiModel.fromJson(item)).toList());
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      throw FormatException('Failed to query $error');
    }
  }

  AsyncResult<bool> removeCartItem({required int cartItemId}) async {
    try {
      final response = await _dio.delete('$_baseUrl/cart/$cartItemId');
      if (response.statusCode == 200) {
        return Success(true);
      } else {
        return Failure(Exception('Failed request'));
      }
    } on DioException catch (error) {
      return Failure(Exception(error.message));
    } catch (error) {
      throw FormatException('Failed to query $error');
    }
  }
}
