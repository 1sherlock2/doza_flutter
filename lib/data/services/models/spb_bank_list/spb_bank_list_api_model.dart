import 'package:freezed_annotation/freezed_annotation.dart';

part 'spb_bank_list_api_model.freezed.dart';
part 'spb_bank_list_api_model.g.dart';

@freezed
abstract class SpbBankListItemApiModel with _$SpbBankListItemApiModel {
  const factory SpbBankListItemApiModel(
      {@JsonKey(name: 'bank_id') required String bankId,
      required String name,
      required String bic}) = _SpbBankListItemApiModel;
  factory SpbBankListItemApiModel.fromJson(Map<String, dynamic> json) =>
      _$SpbBankListItemApiModelFromJson(json);
}

@freezed
abstract class SpbBankListApiModel with _$SpbBankListApiModel {
  const factory SpbBankListApiModel(
      {required String type,
      required List<SpbBankListItemApiModel> items}) = _SpbBankListApiModel;

  factory SpbBankListApiModel.fromJson(Map<String, dynamic> json) =>
      _$SpbBankListApiModelFromJson(json);
}
