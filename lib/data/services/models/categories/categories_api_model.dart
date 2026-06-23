import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_api_model.freezed.dart';
part 'categories_api_model.g.dart';

@freezed
abstract class CategoriesApiModel with _$CategoriesApiModel {
  const factory CategoriesApiModel({
    required int id,
    required String name,
    required String slug,
    String? desctiprion,
    String? imageUrl,
  }) = _CategoriesApiModel;

  factory CategoriesApiModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesApiModelFromJson(json);
}
