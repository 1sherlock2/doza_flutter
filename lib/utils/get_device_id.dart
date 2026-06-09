import 'package:flutter/services.dart';

const _channel = MethodChannel('tracking_client/sim_cards');

Future<String> getDeviceId() async {
  try {
    final id = await _channel.invokeMethod<String>('getDeviceId');
    return id ?? 'unknown';
  } catch (_) {
    return 'unknown';
  }
}
