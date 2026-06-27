// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VolumeInfoApiModel _$VolumeInfoApiModelFromJson(Map<String, dynamic> json) =>
    _VolumeInfoApiModel(
      volumeMl: (json['volumeMl'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      variantId: (json['variantId'] as num).toInt(),
    );

Map<String, dynamic> _$VolumeInfoApiModelToJson(_VolumeInfoApiModel instance) =>
    <String, dynamic>{
      'volumeMl': instance.volumeMl,
      'price': instance.price,
      'variantId': instance.variantId,
    };

_ProductDetailsApiModel _$ProductDetailsApiModelFromJson(
        Map<String, dynamic> json) =>
    _ProductDetailsApiModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      categoryId: (json['categoryId'] as num).toInt(),
      categoryName: json['categoryName'] as String,
      imageUrl: json['imageUrl'] as String,
      basePrice: (json['basePrice'] as num).toInt(),
      volumeInfo: (json['volumeInfo'] as List<dynamic>)
          .map((e) => VolumeInfoApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailsApiModelToJson(
        _ProductDetailsApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'imageUrl': instance.imageUrl,
      'basePrice': instance.basePrice,
      'volumeInfo': instance.volumeInfo,
    };
