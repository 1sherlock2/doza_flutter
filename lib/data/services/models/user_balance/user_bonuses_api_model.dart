import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_bonuses_api_model.freezed.dart';
part 'user_bonuses_api_model.g.dart';

@freezed
abstract class UserBonusesApiModel with _$UserBonusesApiModel {
  const factory UserBonusesApiModel(
      {required int balance, required int bonusPercent}) = _UserBonusesApiModel;

  factory UserBonusesApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserBonusesApiModelFromJson(json);
}
