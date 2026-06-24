import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorites_products_api_model.freezed.dart';
part 'favorites_products_api_model.g.dart';

@freezed
abstract class FavoritesProductsApiModel with _$FavoritesProductsApiModel {
  const factory FavoritesProductsApiModel(
      {required int id,
      required String name,
      required String imageUrl,
      required int basePrice}) = _FavoritesProducts;

  factory FavoritesProductsApiModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritesProductsApiModelFromJson(json);
}
