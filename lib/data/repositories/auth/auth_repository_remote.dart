import 'dart:async';

import 'package:doza_flutter/data/repositories/auth/auth_repository.dart';
import 'package:doza_flutter/data/services/auth_api_client.dart';
import 'package:doza_flutter/data/services/models/auth/auth_api_model/auth_api_model.dart';
import 'package:doza_flutter/data/services/models/auth/auth_register_api_model/auth_register_api_model.dart';
import 'package:doza_flutter/data/services/models/auth/call_status_api_model/call_status_api_model.dart';
import 'package:logging/logging.dart';

class AuthRepositoryRemote implements AuthRepository {
  AuthRepositoryRemote({required AuthApiClient authApiClient})
    : _authApiClient = authApiClient;

  final AuthApiClient _authApiClient;

  final _log = Logger('AuthRepositoryRemote');

  @override
  Future<String?> getPhone() async {
    try {
      final response = await _authApiClient.getAuthPhone();
      if (response.isError()) {
        _log.shout(
          'Response error, loading data: ${response.exceptionOrNull()}',
        );
        return null;
      }
      final phone = response.getOrThrow();
      return phone;
    } catch (error) {
      _log.shout('Error getting phone: $error');
      return null;
    }
  }

  @override
  Future<AuthRegisterApiModel> login({
    required String phoneByAuth,
    required String publicKey,
    required String deviceId,
  }) async {
    try {
      final accessTokenResult = await _authApiClient.login(
        phone: phoneByAuth,
        publicKey: publicKey,
        deviceId: deviceId,
      );
      if (accessTokenResult.isError()) {
        _log.warning(accessTokenResult.exceptionOrNull());
        throw Exception('Register was not success');
      }
      final result = accessTokenResult.getOrThrow();
      return result;
    } catch (error) {
      _log.warning('Register error $error');
      throw Exception('Register error $error');
    }
  }

  @override
  Future<CallStatusApiModel?> verifyCall({
    required AuthApiModel phoneStatus,
  }) async {
    try {
      final result = await _authApiClient.getVerifyCall(
        phoneStatus: phoneStatus,
      );
      if (result.isError()) {
        _log.warning('Error verifying call ${result.exceptionOrNull()}');
        return null;
      }
      return result.getOrThrow();
    } catch (error) {
      _log.warning('Error in verifyCall: $error');
      return null;
    }
  }

  @override
  FutureOr<AuthApiModel?> verifyNumber({
    required String number,
    required String authPhone,
  }) async {
    try {
      final statusPhone = await _authApiClient.getVerifyNumber(
        number: number,
        authPhone: authPhone,
      );
      if (statusPhone.isError()) {
        _log.warning(statusPhone.exceptionOrNull());
        return null;
      }
      final result = statusPhone.getOrNull();
      return result;
    } catch (error) {
      _log.warning('Error verify number: $error');
    }
    return null;
  }
}
