import 'package:flutter/material.dart';

class AutoRenewNotice extends StatelessWidget {
  const AutoRenewNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Подписка продлевается автоматически. Вы можете отменить её в любое время в настройках профиля.',
      style: Theme.of(
        context,
      ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
      textAlign: TextAlign.center,
    );
  }
}
