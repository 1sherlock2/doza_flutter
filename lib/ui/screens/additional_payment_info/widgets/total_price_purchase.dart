import 'package:doza_flutter/data/services/models/city_delivery/city_delivery_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/models/additional_order_info_ui_model.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/view_models/additional_payment_info_view_model.dart';
import 'package:doza_flutter/ui/widgets/box_shadow_custom.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TotalPricePurchase extends StatefulWidget {
  const TotalPricePurchase(
      {super.key,
      required FormGroup form,
      required AdditionalPaymentInfoViewModel additionalPaymentInfoViewModel})
      : _additionalPaymentInfoViewModel = additionalPaymentInfoViewModel,
        _form = form;

  final AdditionalPaymentInfoViewModel _additionalPaymentInfoViewModel;
  final FormGroup _form;
  @override
  State<TotalPricePurchase> createState() => _TotalPricePurchaseState();
}

class _TotalPricePurchaseState extends State<TotalPricePurchase> {
  void createOrder() {
    if (widget._form.valid) {
      final formValue = widget._form.rawValue;
      final model = AdditionalOrderInfoUiModel(
          secondName: formValue['secondName'] as String,
          firstName: formValue['fitstName'] as String,
          city: formValue['city'] as int,
          apartment: formValue['apartment'] as String?,
          street: formValue['street'] as String,
          house: formValue['house'] as String);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            boxShadow: BoxShadowCustom.shadow,
            color: AppColors.white1,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Товары'),
                Text('${widget._additionalPaymentInfoViewModel.productsPrice}₽')
              ],
            ),
            if (widget._additionalPaymentInfoViewModel.isSpendBonuses)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Списание бонусов'),
                  Text(
                      '${widget._additionalPaymentInfoViewModel.spendBonuses}₽')
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Доставка'),
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    final cityId = formGroup.control('city').value as int?;

                    String deliveryCost = '-';
                    if (cityId != null) {
                      final cities =
                          widget._additionalPaymentInfoViewModel.cityDelivery;
                      final found =
                          cities.cast<CityDeliveryApiModel?>().firstWhere(
                                (c) => c!.id == cityId,
                                orElse: () => null,
                              );
                      deliveryCost =
                          found != null ? '${found.deliveryCost}₽' : '-';
                    }
                    return Text(deliveryCost);
                  },
                )
              ],
            ),
            Divider(
              color: AppColors.customBlue7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Итого',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${widget._additionalPaymentInfoViewModel.totalPrice}₽',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: createOrder,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: widget._form.valid
                          ? AppColors.customBlue
                          : AppColors.grey3),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Подтвердить заказ',
                    style: TextStyle(color: AppColors.white1),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
