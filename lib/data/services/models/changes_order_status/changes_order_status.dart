import 'package:freezed_annotation/freezed_annotation.dart';

part 'changes_order_status.freezed.dart';
part 'changes_order_status.g.dart';

@freezed
abstract class ChangesOrderStatus with _$ChangesOrderStatus {
  factory ChangesOrderStatus({required int orderId, required String status}) =
      _ChangesOrderStatus;

  factory ChangesOrderStatus.fromJson(Map<String, dynamic> json) =>
      _$ChangesOrderStatusFromJson(json);
}
