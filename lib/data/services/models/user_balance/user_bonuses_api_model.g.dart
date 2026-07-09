// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bonuses_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserBonusesApiModel _$UserBonusesApiModelFromJson(Map<String, dynamic> json) =>
    _UserBonusesApiModel(
      balance: (json['balance'] as num).toInt(),
      bonusPercent: (json['bonusPercent'] as num).toInt(),
    );

Map<String, dynamic> _$UserBonusesApiModelToJson(
        _UserBonusesApiModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'bonusPercent': instance.bonusPercent,
    };
