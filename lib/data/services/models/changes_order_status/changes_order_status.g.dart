// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changes_order_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChangesOrderStatus _$ChangesOrderStatusFromJson(Map<String, dynamic> json) =>
    _ChangesOrderStatus(
      orderId: (json['orderId'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$ChangesOrderStatusToJson(_ChangesOrderStatus instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'status': instance.status,
    };
