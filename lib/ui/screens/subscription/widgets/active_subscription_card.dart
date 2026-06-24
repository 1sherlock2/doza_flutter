import 'package:doza_flutter/data/services/models/subscription/subscription_status_model.dart';
import 'package:flutter/material.dart';

class ActiveSubscriptionCard extends StatelessWidget {
  const ActiveSubscriptionCard({super.key, required this.status});

  final SubscriptionStatusModel status;

  String _formatDate(DateTime date) {
    const months = [
      'января',
      'февраля',
      'марта',
      'апреля',
      'мая',
      'июня',
      'июля',
      'августа',
      'сентября',
      'октября',
      'ноября',
      'декабря',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year} г.';
  }

  int get _daysLeft {
    if (status.expiresAt == null) return 0;
    final diff = status.expiresAt!.difference(DateTime.now()).inDays + 1;
    return diff > 0 ? diff : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF4CAF50).withValues(alpha: 0.4),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFF4CAF50),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Подписка активна',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ...[
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Text(
                status.isPaidSubscription
                    ? 'Премиум подписка'
                    : 'Пробный период',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
              ),
            ),
          ],
          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 16),
          if (status.expiresAt != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Действует до:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  _formatDate(status.expiresAt!),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Осталось дней:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '$_daysLeft дней',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF4CAF50),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
