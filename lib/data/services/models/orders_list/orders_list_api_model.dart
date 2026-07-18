import 'package:doza_flutter/enums/payment_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_list_api_model.freezed.dart';
part 'orders_list_api_model.g.dart';

@freezed
abstract class OrdersListProductApiModel with _$OrdersListProductApiModel {
  factory OrdersListProductApiModel(
      {required String imageUrl,
      required String name}) = _OrdersListProductApiModel;

  factory OrdersListProductApiModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersListProductApiModelFromJson(json);
}

@freezed
abstract class OrdersListProductVariantApiModel
    with _$OrdersListProductVariantApiModel {
  factory OrdersListProductVariantApiModel(
      {required int price,
      required OrdersListProductApiModel product,
      required int volumeMl}) = _OrdersListProductVariantApiModel;

  factory OrdersListProductVariantApiModel.fromJson(
          Map<String, dynamic> json) =>
      _$OrdersListProductVariantApiModelFromJson(json);
}

@freezed
abstract class OrdersListItemApiModel with _$OrdersListItemApiModel {
  const factory OrdersListItemApiModel(
      {required OrdersListProductVariantApiModel productVariant,
      required int quantity,
      required int pricePerUnit,
      required int subtotal}) = _OrdersListItemApiModel;

  factory OrdersListItemApiModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersListItemApiModelFromJson(json);
}

@freezed
abstract class OrdersListDeliveryCityApiModel
    with _$OrdersListDeliveryCityApiModel {
  factory OrdersListDeliveryCityApiModel({required String city}) =
      _OrdersListDeliveryCityApiModel;

  factory OrdersListDeliveryCityApiModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersListDeliveryCityApiModelFromJson(json);
}

@freezed
abstract class OrdersListDelivery with _$OrdersListDelivery {
  factory OrdersListDelivery(
      {required String address,
      required String estimatedDeliveryTime,
      required OrdersListDeliveryCityApiModel city,
      required DateTime deliveryDate}) = _OrdersListDelivery;

  factory OrdersListDelivery.fromJson(Map<String, dynamic> json) =>
      _$OrdersListDeliveryFromJson(json);
}

@freezed
abstract class OrderPaymentInfoApiModel with _$OrderPaymentInfoApiModel {
  factory OrderPaymentInfoApiModel({required String confirmedUrl}) =
      _OrderPaymentInfoApiModel;

  factory OrderPaymentInfoApiModel.fromJson(Map<String, dynamic> json) =>
      _$OrderPaymentInfoApiModelFromJson(json);
}

@freezed
abstract class OrdersListApiModel with _$OrdersListApiModel {
  const factory OrdersListApiModel(
      {required int id,
      required int finalPrice,
      required PaymentStatus status,
      @JsonKey(
        name: 'created_at',
      )
      required DateTime createdAt,
      required DateTime expiresAt,
      required String preparationStatus,
      required List<OrdersListItemApiModel> orderItems,
      required OrderPaymentInfoApiModel payments,
      required OrdersListDelivery delivery}) = _OrdersListApiModel;

  factory OrdersListApiModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersListApiModelFromJson(json);
}
