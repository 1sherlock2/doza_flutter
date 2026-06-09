import 'package:json_annotation/json_annotation.dart';

import 'call_status_api_model.dart';

class CallStatusConverter implements JsonConverter<CallStatus, String> {
  const CallStatusConverter();

  @override
  CallStatus fromJson(String json) {
    return CallStatus.fromValue(json) ?? CallStatus.expires;
  }

  @override
  String toJson(CallStatus object) {
    return object.value;
  }
}
