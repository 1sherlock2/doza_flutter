import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_delivery_api_model.freezed.dart';
part 'city_delivery_api_model.g.dart';

@freezed
abstract class CityDeliveryApiModel with _$CityDeliveryApiModel {
  const factory CityDeliveryApiModel(
      {required int id,
      required String city,
      required int deliveryCost,
      required int deliveryDays}) = _CityDeliveryApiModel;
  factory CityDeliveryApiModel.fromJson(Map<String, dynamic> json) =>
      _$CityDeliveryApiModelFromJson(json);
}
