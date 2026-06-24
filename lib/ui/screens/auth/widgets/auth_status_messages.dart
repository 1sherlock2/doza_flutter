import 'package:doza_flutter/ui/screens/auth/view_models/auth_view_models.dart';
import 'package:flutter/material.dart';

class AuthStatusMessages extends StatelessWidget {
  const AuthStatusMessages({super.key, required this.authViewModel});

  final AuthViewModel authViewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: authViewModel,
      builder: (context, _) {
        if (authViewModel.isStatusFailed) {
          return Center(
            child: Text(
              'Ошибка при вызове. Проверьте введённый номер и попробуйте снова',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        }
        if (authViewModel.isCallDetecting) {
          return Center(
            child: Text(
              'Вы не смогли дозвониться. Повторите попытку',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
