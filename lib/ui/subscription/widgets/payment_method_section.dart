import 'package:doza_flutter/ui/subscription/widgets/payment_method_option.dart';
import 'package:flutter/material.dart';

class PaymentMethodSection extends StatelessWidget {
  final String selectedMethod;
  final Function(String) onSelectMethod;

  const PaymentMethodSection({
    super.key,
    required this.selectedMethod,
    required this.onSelectMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Способ оплаты',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        PaymentMethodOption(
          icon: Icons.credit_card,
          title: 'Банковская карта',
          value: 'bank_card',
          isSelected: selectedMethod == 'bank_card',
          onTap: () => onSelectMethod('bank_card'),
        ),
        const SizedBox(height: 12),
        PaymentMethodOption(
          icon: Icons.account_balance,
          title: 'СБП',
          value: 'sbp',
          isSelected: selectedMethod == 'sbp',
          onTap: () => onSelectMethod('sbp'),
        ),
      ],
    );
  }
}
