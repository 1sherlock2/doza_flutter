// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_favorites_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserFavoritesApiModel _$UserFavoritesApiModelFromJson(
        Map<String, dynamic> json) =>
    _UserFavoritesApiModel(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
    );

Map<String, dynamic> _$UserFavoritesApiModelToJson(
        _UserFavoritesApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'productId': instance.productId,
    };
