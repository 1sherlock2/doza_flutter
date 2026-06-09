import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_api_model.freezed.dart';
part 'auth_api_model.g.dart';

@freezed
abstract class AuthData with _$AuthData {
  const factory AuthData({
    required String balance,
    @JsonKey(name: 'call_id') required int callId,
    required String created,
    required String phone,
    required String pincode,
  }) = _AuthData;
  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);
}

@freezed
abstract class AuthApiModel with _$AuthApiModel {
  const factory AuthApiModel({required String status, required AuthData data}) =
      _AuthApiModel;
  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);
}
