enum PreparationStatus {
  processing('Обрабатывается'),
  shipped('В пути'),
  delivered('Доставлен');

  final String displayName;
  const PreparationStatus(this.displayName);

  static PreparationStatus fromString(String value) {
    return PreparationStatus.values.firstWhere(
      (status) => status.name == value,
      orElse: () => throw ArgumentError('Unknown status: $value'),
    );
  }
}
