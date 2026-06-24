import 'package:flutter/material.dart';

class PaymentMethodOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodOption({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0xFF4CAF50) : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey.shade700, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: isSelected ? value : null,
              onChanged: (_) => onTap(),
              activeColor: const Color(0xFF4CAF50),
            ),
          ],
        ),
      ),
    );
  }
}
