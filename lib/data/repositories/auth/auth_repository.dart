import 'dart:async';

import 'package:doza_flutter/data/services/models/auth/auth_api_model/auth_api_model.dart';
import 'package:doza_flutter/data/services/models/auth/auth_register_api_model/auth_register_api_model.dart';
import 'package:doza_flutter/data/services/models/auth/call_status_api_model/call_status_api_model.dart';

abstract class AuthRepository {
  Future<String?> getPhone();

  FutureOr<AuthApiModel?> verifyNumber({
    required String number,
    required String authPhone,
  });

  Future<CallStatusApiModel?> verifyCall({required AuthApiModel phoneStatus});
  Future<AuthRegisterApiModel> login({
    required String phoneByAuth,
    required String publicKey,
    required String deviceId,
  });
}
