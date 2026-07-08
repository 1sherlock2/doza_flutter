// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_delivery_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CityDeliveryApiModel _$CityDeliveryApiModelFromJson(
        Map<String, dynamic> json) =>
    _CityDeliveryApiModel(
      id: (json['id'] as num).toInt(),
      city: json['city'] as String,
      deliveryCost: (json['deliveryCost'] as num).toInt(),
    );

Map<String, dynamic> _$CityDeliveryApiModelToJson(
        _CityDeliveryApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'city': instance.city,
      'deliveryCost': instance.deliveryCost,
    };
