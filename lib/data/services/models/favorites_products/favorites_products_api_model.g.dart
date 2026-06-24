// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_products_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoritesProducts _$FavoritesProductsFromJson(Map<String, dynamic> json) =>
    _FavoritesProducts(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      basePrice: (json['basePrice'] as num).toInt(),
    );

Map<String, dynamic> _$FavoritesProductsToJson(_FavoritesProducts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'basePrice': instance.basePrice,
    };
