// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spb_bank_list_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpbBankListItemApiModel _$SpbBankListItemApiModelFromJson(
        Map<String, dynamic> json) =>
    _SpbBankListItemApiModel(
      bankId: json['bank_id'] as String,
      name: json['name'] as String,
      bic: json['bic'] as String,
    );

Map<String, dynamic> _$SpbBankListItemApiModelToJson(
        _SpbBankListItemApiModel instance) =>
    <String, dynamic>{
      'bank_id': instance.bankId,
      'name': instance.name,
      'bic': instance.bic,
    };

_SpbBankListApiModel _$SpbBankListApiModelFromJson(Map<String, dynamic> json) =>
    _SpbBankListApiModel(
      type: json['type'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              SpbBankListItemApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpbBankListApiModelToJson(
        _SpbBankListApiModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'items': instance.items,
    };
