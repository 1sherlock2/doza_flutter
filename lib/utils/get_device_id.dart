import 'package:flutter/services.dart';

const _channel = MethodChannel('doza_flutter/device_id');

Future<String> getDeviceId() async {
  try {
    final id = await _channel.invokeMethod<String>('getDeviceId');
    return id ?? 'unknown';
  } catch (_) {
    return 'unknown';
  }
}
