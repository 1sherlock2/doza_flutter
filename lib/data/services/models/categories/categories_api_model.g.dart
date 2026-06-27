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
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$CategoriesApiModelToJson(_CategoriesApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
    };
