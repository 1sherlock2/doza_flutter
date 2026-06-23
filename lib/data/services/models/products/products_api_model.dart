import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_api_model.freezed.dart';
part 'products_api_model.g.dart';

@freezed
abstract class ProductsApiModel with _$ProductsApiModel {
  const factory ProductsApiModel(
      {required int id,
      required String name,
      String? description,
      required int categoryId,
      required String imageUrl,
      required List<int?> volumeMl,
      required int basePrice}) = _ProductsApiModel;

  factory ProductsApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsApiModelFromJson(json);
}
