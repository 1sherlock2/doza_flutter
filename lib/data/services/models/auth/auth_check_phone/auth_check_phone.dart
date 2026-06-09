import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_check_phone.freezed.dart';
part 'auth_check_phone.g.dart';

@freezed
abstract class AuthCheckPhone with _$AuthCheckPhone {
  const factory AuthCheckPhone({required String number}) = _AuthCheckPhone;
  factory AuthCheckPhone.fromJson(Map<String, dynamic> json) =>
      _$AuthCheckPhoneFromJson(json);
}
