class SubscriptionStatusModel {
  final bool hasActiveSubscription;
  final DateTime? trialExpiresAt;
  final String? status;
  final DateTime? expiresAt;
  final bool? autoRenew;
  final String? planName;
  final int? planPrice;
  final int discountPercent;

  const SubscriptionStatusModel({
    required this.hasActiveSubscription,
    required this.discountPercent,
    this.trialExpiresAt,
    this.status,
    this.expiresAt,
    this.autoRenew = false,
    this.planName,
    this.planPrice,
  });

  factory SubscriptionStatusModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionStatusModel(
      hasActiveSubscription: json['hasActiveSubscription'] as bool? ?? false,
      trialExpiresAt: json['trialExpiresAt'] != null
          ? DateTime.tryParse(json['trialExpiresAt'] as String)
          : null,
      status: json['status'] as String?,
      expiresAt: json['expiresAt'] != null
          ? DateTime.tryParse(json['expiresAt'] as String)
          : null,
      discountPercent: json['discountPercent'],
      autoRenew: json['autoRenew'] as bool? ?? false,
      planName: json['planName'] as String?,
      planPrice: json['planPrice'] as int?,
    );
  }

  /// Куплена платная подписка (приоритет над пробным периодом)
  bool get isPaidSubscription =>
      hasActiveSubscription && planPrice != null && planPrice! > 0;

  /// Отображаемое название плана
  String get displayPlanName {
    switch (planName?.toLowerCase()) {
      case 'monthly':
        return 'Ежемесячная';
      case 'yearly':
        return 'Ежегодная';
      default:
        return planName ?? '';
    }
  }
}
