enum PaymentStatus {
  pending('В процессе оплаты'),
  succeeded('Оплачено'),
  cancelled('Истек'),
  failed('Отменен');

  final String displayName;
  const PaymentStatus(this.displayName);

  static PaymentStatus fromString(String value) {
    return PaymentStatus.values.firstWhere(
      (status) => status.name == value,
      orElse: () => throw ArgumentError('Unknown status: $value'),
    );
  }
}
