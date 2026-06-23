// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_register_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthRegisterApiModel _$AuthRegisterApiModelFromJson(
        Map<String, dynamic> json) =>
    _AuthRegisterApiModel(
      authPayload: json['authPayload'] as String,
      isNewUser: json['isNewUser'] as bool? ?? false,
    );

Map<String, dynamic> _$AuthRegisterApiModelToJson(
        _AuthRegisterApiModel instance) =>
    <String, dynamic>{
      'authPayload': instance.authPayload,
      'isNewUser': instance.isNewUser,
    };
