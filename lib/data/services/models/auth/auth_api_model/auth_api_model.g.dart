// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthData _$AuthDataFromJson(Map<String, dynamic> json) => _AuthData(
      balance: json['balance'] as String,
      callId: (json['call_id'] as num).toInt(),
      created: json['created'] as String,
      phone: json['phone'] as String,
      pincode: json['pincode'] as String,
    );

Map<String, dynamic> _$AuthDataToJson(_AuthData instance) => <String, dynamic>{
      'balance': instance.balance,
      'call_id': instance.callId,
      'created': instance.created,
      'phone': instance.phone,
      'pincode': instance.pincode,
    };

_AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) =>
    _AuthApiModel(
      status: json['status'] as String,
      data: AuthData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthApiModelToJson(_AuthApiModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
