// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_status_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CallStatusApiModel _$CallStatusApiModelFromJson(Map<String, dynamic> json) =>
    _CallStatusApiModel(
      status: const CallStatusConverter().fromJson(json['status'] as String),
      callId: (json['call_id'] as num).toInt(),
      created: json['created'] as String,
      phone: json['phone'] as String,
      dialStatusDisplay: json['dial_status_display'] as String?,
    );

Map<String, dynamic> _$CallStatusApiModelToJson(_CallStatusApiModel instance) =>
    <String, dynamic>{
      'status': const CallStatusConverter().toJson(instance.status),
      'call_id': instance.callId,
      'created': instance.created,
      'phone': instance.phone,
      'dial_status_display': instance.dialStatusDisplay,
    };
