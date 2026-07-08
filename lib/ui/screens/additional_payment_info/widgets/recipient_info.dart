import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/widgets/box_shadow_custom.dart';
import 'package:doza_flutter/ui/widgets/input_decoration_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RecipientInfo extends StatefulWidget {
  const RecipientInfo({
    super.key,
    required bool showErrors,
  }) : _showErrors = showErrors;
  final bool _showErrors;

  @override
  State<RecipientInfo> createState() => _RecipientInfoState();
}

class _RecipientInfoState extends State<RecipientInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          boxShadow: BoxShadowCustom.shadow,
          color: AppColors.white1,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        spacing: 12,
        children: [
          Row(
            spacing: 10,
            children: [
              Icon(
                Icons.person_2_outlined,
                color: AppColors.customBlue,
                size: 26,
              ),
              Text('Получатель')
            ],
          ),
          Row(
            spacing: 12,
            children: [
              Expanded(
                  child: ReactiveTextField(
                cursorColor: AppColors.customBlue7,
                cursorErrorColor: AppColors.customBlue7,
                validationMessages: {'required': (error) => 'Обязательно'},
                showErrors: (control) => control.touched,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Zа-яА-ЯёЁ\s\-]'))
                ],
                formControlName: 'secondName',
                decoration: InputDecorationCustom(labelText: 'Фамилия'),
              )),
              Expanded(
                  child: ReactiveTextField(
                cursorColor: AppColors.customBlue7,
                cursorErrorColor: AppColors.customBlue7,
                showErrors: (control) => control.touched,
                validationMessages: {'required': (error) => 'Обязательно'},
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Zа-яА-ЯёЁ\s\-]'))
                ],
                formControlName: 'firstName',
                decoration: InputDecorationCustom(labelText: 'Имя'),
              ))
            ],
          )
        ],
      ),
    );
  }
}
