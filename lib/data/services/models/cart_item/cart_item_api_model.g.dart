// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItemApiModel _$CartItemApiModelFromJson(Map<String, dynamic> json) =>
    _CartItemApiModel(
      cartItemId: (json['cartItemId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      variantId: (json['variantId'] as num).toInt(),
      volumeMl: (json['volumeMl'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      productName: json['productName'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CartItemApiModelToJson(_CartItemApiModel instance) =>
    <String, dynamic>{
      'cartItemId': instance.cartItemId,
      'quantity': instance.quantity,
      'variantId': instance.variantId,
      'volumeMl': instance.volumeMl,
      'price': instance.price,
      'productId': instance.productId,
      'productName': instance.productName,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
    };
