class SubscriptionStatusModel {
  final bool hasActiveSubscription;
  final bool isTrialActive;
  final DateTime? trialExpiresAt;
  final String? status;
  final DateTime? expiresAt;
  final bool autoRenew;
  final String? planName;
  final int? planPrice;

  const SubscriptionStatusModel({
    required this.hasActiveSubscription,
    required this.isTrialActive,
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
      isTrialActive: json['isTrialActive'] as bool? ?? false,
      trialExpiresAt: json['trialExpiresAt'] != null
          ? DateTime.tryParse(json['trialExpiresAt'] as String)
          : null,
      status: json['status'] as String?,
      expiresAt: json['expiresAt'] != null
          ? DateTime.tryParse(json['expiresAt'] as String)
          : null,
      autoRenew: json['autoRenew'] as bool? ?? false,
      planName: json['planName'] as String?,
      planPrice: json['planPrice'] as int?,
    );
  }

  /// Количество дней триала, оставшихся до конца
  int get trialDaysLeft {
    if (trialExpiresAt == null) return 0;
    final diff = trialExpiresAt!.difference(DateTime.now()).inDays;
    return diff > 0 ? diff : 0;
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
