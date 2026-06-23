// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductsApiModel _$ProductsApiModelFromJson(Map<String, dynamic> json) =>
    _ProductsApiModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      categoryId: (json['categoryId'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      volumeMl: (json['volumeMl'] as List<dynamic>)
          .map((e) => (e as num?)?.toInt())
          .toList(),
      basePrice: (json['basePrice'] as num).toInt(),
    );

Map<String, dynamic> _$ProductsApiModelToJson(_ProductsApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'imageUrl': instance.imageUrl,
      'volumeMl': instance.volumeMl,
      'basePrice': instance.basePrice,
    };
