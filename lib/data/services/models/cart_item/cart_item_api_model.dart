import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_api_model.freezed.dart';
part 'cart_item_api_model.g.dart';

@freezed
abstract class CartItemApiModel with _$CartItemApiModel {
  const factory CartItemApiModel(
      {required int cartItemId,
      required int quantity,
      @JsonKey(includeToJson: false) required String createdAt,
      required int variantId,
      required int volumeMl,
      required int price,
      required int productId,
      required String productName,
      required String imageUrl,
      String? description}) = _CartItemApiModel;

  factory CartItemApiModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemApiModelFromJson(json);
}
