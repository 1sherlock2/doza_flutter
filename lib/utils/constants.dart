enum ConstantsEnum {
  authPayload('auth_payload'),
  publicKey('public_key'),
  privateKey('private_key'),
  userPhone('user_phone');

  final String value;
  const ConstantsEnum(this.value);

  static ConstantsEnum? fromValue(String? value) {
    try {
      return ConstantsEnum.values.firstWhere((e) => e.value == value);
    } catch (_) {
      return null;
    }
  }
}
