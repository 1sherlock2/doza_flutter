class SubscriptionPlanModel {
  final int id;
  final String name;
  final int price; // в рублях
  final int durationsDays;
  final bool isActive;
  final int? discount; // скидка в %
  final int? originalPrice; // исходная цена для отображения зачёркивания

  const SubscriptionPlanModel({
    required this.id,
    required this.name,
    required this.price,
    required this.durationsDays,
    required this.isActive,
    this.discount,
    this.originalPrice,
  });

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionPlanModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      durationsDays: json['durationsDays'] as int,
      isActive: json['isActive'] as bool? ?? true,
      discount: json['discountPercent'] as int?,
      originalPrice:
          json['originalPrice'] as int? ?? json['original_price'] as int?,
    );
  }

  /// Отображаемая цена в рублях
  String get priceRubles => '$price ₽';

  /// Отображаемое название плана
  String get displayName {
    switch (name.toLowerCase()) {
      case 'monthly':
        return 'Месячная подписка';
      case 'yearly':
        return 'Годовая подписка';
      default:
        return name;
    }
  }

  /// Подзаголовок плана
  String get subtitle {
    if (durationsDays <= 31) return '$priceRubles / месяц';
    if (durationsDays >= 365) return '$priceRubles / год';
    return priceRubles;
  }
}
