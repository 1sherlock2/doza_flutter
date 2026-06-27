import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_details_api_model.freezed.dart';
part 'product_details_api_model.g.dart';

@freezed
abstract class VolumeInfoApiModel with _$VolumeInfoApiModel {
  const factory VolumeInfoApiModel(
      {required int volumeMl,
      required int price,
      required int variantId}) = _VolumeInfoApiModel;
  factory VolumeInfoApiModel.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoApiModelFromJson(json);
}

@freezed
abstract class ProductDetailsApiModel with _$ProductDetailsApiModel {
  const factory ProductDetailsApiModel(
      {required int id,
      required String name,
      String? description,
      required int categoryId,
      required String categoryName,
      required String imageUrl,
      required int basePrice,
      required List<VolumeInfoApiModel> volumeInfo}) = _ProductDetailsApiModel;
  factory ProductDetailsApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsApiModelFromJson(json);
}
