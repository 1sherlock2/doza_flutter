import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/view_models/additional_payment_info_view_model.dart';
import 'package:doza_flutter/ui/widgets/box_shadow_custom.dart';
import 'package:doza_flutter/ui/widgets/input_decoration_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddressDelivery extends StatefulWidget {
  const AddressDelivery(
      {super.key,
      required FormGroup form,
      required AdditionalPaymentInfoViewModel additionalPaymentInfoViewModel})
      : _additionalPaymentInfoViewModel = additionalPaymentInfoViewModel,
        _form = form;

  final AdditionalPaymentInfoViewModel _additionalPaymentInfoViewModel;
  final FormGroup _form;

  @override
  State<AddressDelivery> createState() => _AddressDeliveryState();
}

class _AddressDeliveryState extends State<AddressDelivery> {
  @override
  void initState() {
    super.initState();

    widget._additionalPaymentInfoViewModel.getCityDelivery().then((_) {
      final cities = widget._additionalPaymentInfoViewModel.cityDelivery;

      if (cities.length == 1) {
        widget._form.control('city').value = cities.first.id;
      }
    });
  }

  void handleSelectedCity({required FormGroup formGroup, required int cityId}) {
    formGroup.control('city').value = cityId;
    widget._additionalPaymentInfoViewModel.selectedDeliveryCity(cityId);
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
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Row(
            spacing: 10,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.customBlue,
                size: 26,
              ),
              Text('Адрес доставки')
            ],
          ),
          Wrap(
            spacing: 10,
            alignment: WrapAlignment.start,
            children: widget._additionalPaymentInfoViewModel.cityDelivery
                .map((cityItem) => ReactiveFormConsumer(
                      builder: (context, formGroup, child) {
                        final selectedCityId =
                            formGroup.control('city').value as int?;
                        final isSelected = selectedCityId == cityItem.id;

                        return GestureDetector(
                          onTap: () => handleSelectedCity(
                              formGroup: formGroup, cityId: cityItem.id),
                          child: IntrinsicWidth(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: isSelected
                                    ? AppColors.customBlue
                                    : AppColors.customBlue2,
                              ),
                              child: Text(
                                cityItem.city,
                                style: TextStyle(
                                    color: isSelected
                                        ? AppColors.white1
                                        : AppColors.customBlue),
                              ),
                            ),
                          ),
                        );
                      },
                    ))
                .toList(),
          ),
          Row(
            children: [
              Expanded(
                  child: ReactiveTextField(
                cursorColor: AppColors.customBlue7,
                cursorErrorColor: AppColors.customBlue7,
                validationMessages: {'required': (error) => 'Обязательно'},
                showErrors: (control) => control.touched,
                formControlName: 'street',
                decoration: InputDecorationCustom(labelText: 'Улица'),
              ))
            ],
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: ReactiveTextField(
                  cursorColor: AppColors.customBlue7,
                  cursorErrorColor: AppColors.customBlue7,
                  validationMessages: {'required': (error) => 'Обязательно'},
                  showErrors: (control) => control.touched,
                  formControlName: 'house',
                  decoration: InputDecorationCustom(labelText: 'Дом'),
                ),
              ),
              Expanded(
                child: ReactiveTextField(
                  cursorColor: AppColors.customBlue7,
                  cursorErrorColor: AppColors.customBlue7,
                  formControlName: 'apartment',
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                  ],
                  decoration: InputDecorationCustom(labelText: 'Квартира'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
