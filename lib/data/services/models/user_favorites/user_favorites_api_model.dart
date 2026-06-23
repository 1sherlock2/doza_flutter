import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_favorites_api_model.freezed.dart';
part 'user_favorites_api_model.g.dart';

@freezed
abstract class UserFavoritesApiModel with _$UserFavoritesApiModel {
  const factory UserFavoritesApiModel(
      {required int id,
      required int userId,
      required int productId}) = _UserFavoritesApiModel;

  factory UserFavoritesApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserFavoritesApiModelFromJson(json);
}
