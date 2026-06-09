import 'dart:convert';

import 'package:doza_flutter/utils/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<({String accessToken, String refreshToken})?> getAuthPayload() async {
  final FlutterSecureStorage storage = .new();
  final String? payload = await storage.read(
    key: ConstantsEnum.authPayload.value,
  );
  if (payload == null) return null;

  final Map<String, dynamic> data = jsonDecode(payload);
  final String? accessToken = data['accessToken'];
  final String? refreshToken = data['refreshToken'];
  if (accessToken == null || refreshToken == null) return null;
  return (accessToken: accessToken, refreshToken: refreshToken);
}
