enum ConstantsEnum {
  authPayload('auth_payload'),
  publicKey('public_key'),
  privateKey('private_key'),
  userPhone('user_phone'),
  catalogProductsGrid('catalog_products_grid');

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

enum CardAction { increment, decrement }
