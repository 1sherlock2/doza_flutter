import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_api_model.freezed.dart';
part 'user_info_api_model.g.dart';

@freezed
abstract class UserInfoApiModel with _$UserInfoApiModel {
  factory UserInfoApiModel(
      {required int id,
      required String phone,
      required int balance,
      required int bonusBalance}) = _UserInfoApiModel;

  factory UserInfoApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoApiModelFromJson(json);
}
