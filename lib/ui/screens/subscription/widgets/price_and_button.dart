import 'package:doza_flutter/data/services/models/subscription/subscription_plan_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class PriceAndButton extends StatelessWidget {
  final List<SubscriptionPlanModel> plans;
  final int? selectedPlanId;
  final bool isLoading;
  final VoidCallback onPayTap;
  final String? errorMessage;
  final VoidCallback onRetryCheckStatus;

  const PriceAndButton({
    super.key,
    required this.plans,
    required this.selectedPlanId,
    required this.isLoading,
    required this.onPayTap,
    required this.errorMessage,
    required this.onRetryCheckStatus,
  });

  @override
  Widget build(BuildContext context) {
    final selectedPlan = selectedPlanId != null
        ? plans.firstWhere(
            (p) => p.id == selectedPlanId,
            orElse: () => plans.first,
          )
        : (plans.isNotEmpty ? plans.first : null);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (selectedPlan != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Итого к оплате:',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    selectedPlan.priceRubles,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
            FilledButton(
              onPressed: isLoading ? null : onPayTap,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.customBlue8,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    )
                  : const Text(
                      'Оплатить подписку',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
            ),
            // if (errorMessage != null) ...[
            //   const SizedBox(height: 12),
            //   Text(
            //     errorMessage!,
            //     style: TextStyle(
            //       color: Theme.of(context).colorScheme.error,
            //       fontSize: 14,
            //     ),
            //     textAlign: TextAlign.center,
            //   ),
            // ],
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: isLoading ? null : onRetryCheckStatus,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: AppColors.customBlue8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Уже оплатил — проверить статус',
                style: TextStyle(
                  color: AppColors.customBlue8,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
