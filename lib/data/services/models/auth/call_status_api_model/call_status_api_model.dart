import 'package:freezed_annotation/freezed_annotation.dart';

import 'call_status_converter.dart';

part 'call_status_api_model.freezed.dart';
part 'call_status_api_model.g.dart';

enum CallStatus {
  pincodeOk('pincode_ok'),
  pincodeNook('pincode_nook'),
  expires('expires'),
  inProcess('in_process');

  final String value;
  const CallStatus(this.value);

  static CallStatus? fromValue(String? value) {
    try {
      return CallStatus.values.firstWhere((e) => e.value == value);
    } catch (_) {
      return null;
    }
  }
}

@freezed
abstract class CallStatusApiModel with _$CallStatusApiModel {
  const factory CallStatusApiModel({
    @CallStatusConverter() required CallStatus status,
    @JsonKey(name: 'call_id') required int callId,
    required String created,
    required String phone,
    @JsonKey(name: 'dial_status_display') String? dialStatusDisplay,
  }) = _CallStatusApiModel;

  factory CallStatusApiModel.fromJson(Map<String, dynamic> json) =>
      _$CallStatusApiModelFromJson(json);
}
