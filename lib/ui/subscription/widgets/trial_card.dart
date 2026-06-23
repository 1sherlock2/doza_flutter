import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class TrialCard extends StatelessWidget {
  const TrialCard({super.key, required this.onTap, required this.isSelected});

  final VoidCallback onTap;
  final bool isSelected;

  static const _bullets = [
    'Ограниченные функции приложения',
    'Отображение рекламы',
    'Отсутствие скидок',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: isSelected
              ? Border.all(
                  color: const Color.fromARGB(255, 105, 126, 222), width: 2)
              : null,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.play_circle_outline,
                color: AppColors.customBlue,
                size: 26,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Бесплатный план',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 10),
                  ..._bullets.map(
                    (b) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.circle,
                              size: 7, color: Colors.blue.shade100),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              b,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
