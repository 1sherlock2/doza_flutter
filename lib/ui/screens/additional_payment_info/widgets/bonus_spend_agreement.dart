import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/view_models/additional_payment_info_view_model.dart';
import 'package:doza_flutter/ui/widgets/box_shadow_custom.dart';
import 'package:flutter/material.dart';

class BonusSpendAgreement extends StatefulWidget {
  const BonusSpendAgreement(
      {super.key,
      required AdditionalPaymentInfoViewModel additionalPaymentInfoViewModel})
      : _additionalPaymentInfoViewModel = additionalPaymentInfoViewModel;

  final AdditionalPaymentInfoViewModel _additionalPaymentInfoViewModel;

  @override
  State<BonusSpendAgreement> createState() => _BonusSpendAgreementState();
}

class _BonusSpendAgreementState extends State<BonusSpendAgreement> {
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
            spacing: 12,
            children: [
              Icon(
                Icons.monetization_on_outlined,
                size: 24,
                color: AppColors.customBlue,
              ),
              Text('Бонусные баллы')
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                color: AppColors.grey2,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Доступно к списанию',
                    style: TextStyle(color: AppColors.grey5),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${widget._additionalPaymentInfoViewModel.bonusBalance}₽',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColors.customBlue1,
                  borderRadius: BorderRadius.circular(10)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Material(
                  color: AppColors.customBlue1,
                  child: CheckboxListTile(
                    horizontalTitleGap: 4,
                    contentPadding: EdgeInsets.zero,
                    checkColor: AppColors.customBlue,
                    side: BorderSide(
                      color: AppColors.grey5!,
                    ),
                    value:
                        widget._additionalPaymentInfoViewModel.isSpendBonuses,
                    onChanged: widget
                        ._additionalPaymentInfoViewModel.changeSpendBonuses,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text(
                      'Согласен на списание бонусных баллов в счет оплаты данного заказа',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
