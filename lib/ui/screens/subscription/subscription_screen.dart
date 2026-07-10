import 'package:doza_flutter/data/services/auth_state_notifier.dart';
import 'package:doza_flutter/data/services/models/subscription/subscription_plan_model.dart';
import 'package:doza_flutter/routing/routes.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/subscription/view_models/subscription_view_model.dart';
import 'package:doza_flutter/ui/screens/subscription/widgets/active_subscription_card.dart';
import 'package:doza_flutter/ui/screens/subscription/widgets/payment_checking_widget.dart';
import 'package:doza_flutter/ui/screens/subscription/widgets/payment_method_section.dart';
import 'package:doza_flutter/ui/screens/subscription/widgets/price_and_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _benefits = [
  'Скидка 30% на каждую покупку',
  'Привелигированное обслуживание',
  'Без рекламы',
];

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({
    super.key,
    required this.viewModel,
    required this.authStateNotifier,
  });

  final SubscriptionViewModel viewModel;
  final AuthStateNotifier authStateNotifier;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: authStateNotifier,
      builder: (context, _) => Scaffold(
        backgroundColor: AppColors.white2,
        appBar: AppBar(
          title: const Text('Подписка'),
          backgroundColor: AppColors.white1,
          automaticallyImplyLeading: false,
          leading: context.canPop()
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => context.pop(),
                )
              : authStateNotifier.showSubscriptionBackButton
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => context.go(Routes.subscriptionSelect),
                    )
                  : null,
        ),
        body: ListenableBuilder(
          listenable: viewModel,
          builder: (context, _) {
            if (viewModel.state == SubscriptionViewState.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            final status = viewModel.status;
            if (status != null && status.hasActiveSubscription) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ActiveSubscriptionCard(status: status),
              );
            }

            if (viewModel.isPollingPayment) {
              return const PaymentCheckingWidget();
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _BenefitsCard(),
                  const SizedBox(height: 32),
                  _SelectPlanSection(
                    plans: viewModel.plans,
                    selectedPlanId: viewModel.selectedPlanId,
                    onSelectPlan: viewModel.selectPlan,
                  ),
                  const SizedBox(height: 32),
                  PaymentMethodSection(
                    selectedMethod: viewModel.selectedPaymentMethod,
                    onSelectMethod: viewModel.selectPaymentMethod,
                  ),
                  const SizedBox(height: 24),
                  PriceAndButton(
                    plans: viewModel.plans,
                    selectedPlanId: viewModel.selectedPlanId,
                    isLoading: viewModel.isCreatingPayment,
                    onPayTap: () =>
                        viewModel.subscribe(viewModel.selectedPlanId ?? 0),
                    errorMessage: viewModel.errorMessage,
                    onRetryCheckStatus: viewModel.retryCheckStatus,
                  ),
                  const SizedBox(height: 20),
                  // const AutoRenewNotice(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BenefitsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Преимущества подписки',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ..._benefits.map(
              (benefit) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2, right: 12),
                      child: Icon(
                        Icons.check_circle,
                        color: AppColors.customBlue8,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        benefit,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectPlanSection extends StatelessWidget {
  final List<SubscriptionPlanModel> plans;
  final int? selectedPlanId;
  final Function(int) onSelectPlan;

  const _SelectPlanSection({
    required this.plans,
    required this.selectedPlanId,
    required this.onSelectPlan,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Выберите план',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...plans.where((p) => p.isActive).map((plan) {
              final isSelected = selectedPlanId == plan.id;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: () => onSelectPlan(plan.id),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? AppColors.customBlue8
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    plan.displayName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        plan.subtitle,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: Colors.grey.shade700),
                                      ),
                                      if (plan.originalPrice != null) ...[
                                        const SizedBox(width: 8),
                                        Text(
                                          '${plan.originalPrice} ₽',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Radio<int>(
                              value: plan.id,
                              groupValue: selectedPlanId,
                              onChanged: (value) {
                                if (value != null) onSelectPlan(value);
                              },
                              activeColor: AppColors.customBlue8,
                            ),
                          ],
                        ),
                      ),
                      if (plan.discount != null)
                        Positioned(
                          top: 0,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.customBlue8,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '-${plan.discount}%',
                              style: const TextStyle(
                                color: AppColors.white2,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
