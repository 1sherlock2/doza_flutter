// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_list_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrdersListProductApiModel _$OrdersListProductApiModelFromJson(
        Map<String, dynamic> json) =>
    _OrdersListProductApiModel(
      imageUrl: json['imageUrl'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$OrdersListProductApiModelToJson(
        _OrdersListProductApiModel instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
    };

_OrdersListProductVariantApiModel _$OrdersListProductVariantApiModelFromJson(
        Map<String, dynamic> json) =>
    _OrdersListProductVariantApiModel(
      price: (json['price'] as num).toInt(),
      product: OrdersListProductApiModel.fromJson(
          json['product'] as Map<String, dynamic>),
      volumeMl: (json['volumeMl'] as num).toInt(),
    );

Map<String, dynamic> _$OrdersListProductVariantApiModelToJson(
        _OrdersListProductVariantApiModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'product': instance.product,
      'volumeMl': instance.volumeMl,
    };

_OrdersListItemApiModel _$OrdersListItemApiModelFromJson(
        Map<String, dynamic> json) =>
    _OrdersListItemApiModel(
      productVariant: OrdersListProductVariantApiModel.fromJson(
          json['productVariant'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      pricePerUnit: (json['pricePerUnit'] as num).toInt(),
      subtotal: (json['subtotal'] as num).toInt(),
    );

Map<String, dynamic> _$OrdersListItemApiModelToJson(
        _OrdersListItemApiModel instance) =>
    <String, dynamic>{
      'productVariant': instance.productVariant,
      'quantity': instance.quantity,
      'pricePerUnit': instance.pricePerUnit,
      'subtotal': instance.subtotal,
    };

_OrdersListDeliveryCityApiModel _$OrdersListDeliveryCityApiModelFromJson(
        Map<String, dynamic> json) =>
    _OrdersListDeliveryCityApiModel(
      city: json['city'] as String,
    );

Map<String, dynamic> _$OrdersListDeliveryCityApiModelToJson(
        _OrdersListDeliveryCityApiModel instance) =>
    <String, dynamic>{
      'city': instance.city,
    };

_OrdersListDelivery _$OrdersListDeliveryFromJson(Map<String, dynamic> json) =>
    _OrdersListDelivery(
      address: json['address'] as String,
      estimatedDeliveryTime: json['estimatedDeliveryTime'] as String,
      city: OrdersListDeliveryCityApiModel.fromJson(
          json['city'] as Map<String, dynamic>),
      deliveryDate: DateTime.parse(json['deliveryDate'] as String),
    );

Map<String, dynamic> _$OrdersListDeliveryToJson(_OrdersListDelivery instance) =>
    <String, dynamic>{
      'address': instance.address,
      'estimatedDeliveryTime': instance.estimatedDeliveryTime,
      'city': instance.city,
      'deliveryDate': instance.deliveryDate.toIso8601String(),
    };

_OrderPaymentInfoApiModel _$OrderPaymentInfoApiModelFromJson(
        Map<String, dynamic> json) =>
    _OrderPaymentInfoApiModel(
      confirmedUrl: json['confirmedUrl'] as String,
    );

Map<String, dynamic> _$OrderPaymentInfoApiModelToJson(
        _OrderPaymentInfoApiModel instance) =>
    <String, dynamic>{
      'confirmedUrl': instance.confirmedUrl,
    };

_OrdersListApiModel _$OrdersListApiModelFromJson(Map<String, dynamic> json) =>
    _OrdersListApiModel(
      id: (json['id'] as num).toInt(),
      finalPrice: (json['finalPrice'] as num).toInt(),
      status: $enumDecode(_$PaymentStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['created_at'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      preparationStatus: json['preparationStatus'] as String,
      orderItems: (json['orderItems'] as List<dynamic>)
          .map(
              (e) => OrdersListItemApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      payments: OrderPaymentInfoApiModel.fromJson(
          json['payments'] as Map<String, dynamic>),
      delivery:
          OrdersListDelivery.fromJson(json['delivery'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrdersListApiModelToJson(_OrdersListApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'finalPrice': instance.finalPrice,
      'status': _$PaymentStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
      'preparationStatus': instance.preparationStatus,
      'orderItems': instance.orderItems,
      'payments': instance.payments,
      'delivery': instance.delivery,
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.pending: 'pending',
  PaymentStatus.succeeded: 'succeeded',
  PaymentStatus.cancelled: 'cancelled',
  PaymentStatus.failed: 'failed',
};
