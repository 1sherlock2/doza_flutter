// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoriesApiModel _$CategoriesApiModelFromJson(Map<String, dynamic> json) =>
    _CategoriesApiModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      slug: json['slug'] as String,
      desctiprion: json['desctiprion'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$CategoriesApiModelToJson(_CategoriesApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'desctiprion': instance.desctiprion,
      'imageUrl': instance.imageUrl,
    };
