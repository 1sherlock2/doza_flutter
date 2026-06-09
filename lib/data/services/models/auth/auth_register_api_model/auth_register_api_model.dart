import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_register_api_model.freezed.dart';
part 'auth_register_api_model.g.dart';

@freezed
abstract class AuthRegisterApiModel with _$AuthRegisterApiModel {
  const factory AuthRegisterApiModel({
    required String authPayload,
    @Default(false) bool isNewUser,
  }) = _AuthRegisterApiModel;

  factory AuthRegisterApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthRegisterApiModelFromJson(json);
}
