// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfoApiModel _$UserInfoApiModelFromJson(Map<String, dynamic> json) =>
    _UserInfoApiModel(
      id: (json['id'] as num).toInt(),
      phone: json['phone'] as String,
      balance: (json['balance'] as num).toInt(),
      bonusBalance: (json['bonusBalance'] as num).toInt(),
    );

Map<String, dynamic> _$UserInfoApiModelToJson(_UserInfoApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone': instance.phone,
      'balance': instance.balance,
      'bonusBalance': instance.bonusBalance,
    };
