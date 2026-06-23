import 'package:doza_flutter/data/services/auth_state_notifier.dart';
import 'package:doza_flutter/routing/routes.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/subscription/widgets/premium_card.dart';
import 'package:doza_flutter/ui/subscription/widgets/trial_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubscriptionSelectScreen extends StatefulWidget {
  const SubscriptionSelectScreen({super.key, required this.authStateNotifier});

  final AuthStateNotifier authStateNotifier;

  @override
  State<SubscriptionSelectScreen> createState() =>
      _SubscriptionSelectScreenState();
}

class _SubscriptionSelectScreenState extends State<SubscriptionSelectScreen> {
  String? _selectedPlan; // 'trial' or 'premium'

  void _onConfirm() {
    if (_selectedPlan == 'trial') {
      widget.authStateNotifier.clearNewUserRegistration();
      context.go(Routes.home);
    } else if (_selectedPlan == 'premium') {
      widget.authStateNotifier.enterSubscriptionFromRegistration();
      context.go(Routes.subscription);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 2),
              Text(
                'Выберите способ\nиспользования',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Начните с пробного периода или оформите подписку',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
              ),
              const Spacer(flex: 3),
              TrialCard(
                isSelected: _selectedPlan == 'trial',
                onTap: () => setState(() => _selectedPlan = 'trial'),
              ),
              const SizedBox(height: 16),
              PremiumCard(
                isSelected: _selectedPlan == 'premium',
                onTap: () => setState(() => _selectedPlan = 'premium'),
              ),
              const Spacer(flex: 2),
              ElevatedButton(
                onPressed: _selectedPlan != null ? _onConfirm : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.customBlue,
                  disabledBackgroundColor: Colors.grey.shade300,
                  foregroundColor: Colors.white,
                  disabledForegroundColor: Colors.grey.shade500,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Выбрать',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: _selectedPlan != null
                            ? Colors.white
                            : Colors.grey.shade500,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Вы всегда можете изменить свой выбор в настройках профиля',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade500),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
