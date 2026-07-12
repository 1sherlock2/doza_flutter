import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/payment_method_section/payment_method_section.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/view_models/additional_payment_info_view_model.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/widgets/address_delivery.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/widgets/bonus_spend_agreement.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/widgets/product_info_payment.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/widgets/recipient_info.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/widgets/total_price_purchase.dart';
import 'package:doza_flutter/ui/view_models/user_info_view_model.dart';
import 'package:doza_flutter/ui/widgets/arrow_left_icon.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AdditionalInfoPayment extends StatefulWidget {
  const AdditionalInfoPayment(
      {super.key,
      required AdditionalPaymentInfoViewModel additionalPaymentInfoViewModel})
      : _additionalPaymentInfoViewModel = additionalPaymentInfoViewModel;

  final AdditionalPaymentInfoViewModel _additionalPaymentInfoViewModel;

  @override
  State<AdditionalInfoPayment> createState() => _AdditionalInfoPaymentState();
}

class _AdditionalInfoPaymentState extends State<AdditionalInfoPayment> {
  final form = FormGroup({
    'secondName': FormControl<String>(validators: [
      Validators.required,
    ]),
    'firstName': FormControl<String>(validators: [Validators.required]),
    'city': FormControl<int>(validators: [Validators.required]),
    'street': FormControl<String>(validators: [Validators.required]),
    'house': FormControl<String>(validators: [Validators.required]),
    'apartment': FormControl<String>()
  });

  final bool _showErrors = false;
  bool get showErrors => _showErrors;

  @override
  void initState() {
    super.initState();
    widget._additionalPaymentInfoViewModel.getSelectedCartItems();
    widget._additionalPaymentInfoViewModel.getCityDelivery();
    context.read<UserInfoViewModel>().getUserBonuses();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white2,
      child: ReactiveForm(
          formGroup: form,
          child: Column(
            children: [
              Container(
                color: AppColors.white1,
                padding:
                    EdgeInsets.only(top: 44, left: 16, right: 16, bottom: 10),
                child: Row(
                  spacing: 16,
                  children: [
                    ArrowLeftIcon(
                      onClick: () => context.pop(),
                      backgroundColor: AppColors.customBlue2,
                      iconColor: AppColors.customBlue,
                    ),
                    Text(
                      'Оформление заказа',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListenableBuilder(
                  listenable: widget._additionalPaymentInfoViewModel,
                  builder: (context, child) => SingleChildScrollView(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        spacing: 14,
                        children: [
                          ProductInfoPayment(
                            additionalPaymentInfoViewModel:
                                widget._additionalPaymentInfoViewModel,
                          ),
                          RecipientInfo(
                            showErrors: showErrors,
                          ),
                          AddressDelivery(
                              form: form,
                              additionalPaymentInfoViewModel:
                                  widget._additionalPaymentInfoViewModel),
                          if (!context
                                  .read<UserInfoViewModel>()
                                  .hasSubscription &&
                              context
                                      .read<UserInfoViewModel>()
                                      .userBonuses
                                      .balance >
                                  0)
                            BonusSpendAgreement(
                                additionalPaymentInfoViewModel:
                                    widget._additionalPaymentInfoViewModel),
                          PaymentMethodSection(
                              selectedMethod: widget
                                  ._additionalPaymentInfoViewModel
                                  .selectedPaymentMethod,
                              onSelectMethod: widget
                                  ._additionalPaymentInfoViewModel
                                  .selectPaymentMethod),
                          TotalPricePurchase(
                              form: form,
                              additionalPaymentInfoViewModel:
                                  widget._additionalPaymentInfoViewModel),
                          if (widget._additionalPaymentInfoViewModel
                              .errorByCreateOrder)
                            Text(
                              'Не удалось совершить платеж. Пожалуйста проверьте данные или свяжитесь с поддержкой в разделе (Обратная связь)',
                              style: TextStyle(
                                  color: AppColors.red1, fontSize: 12),
                            )
                        ],
                      )),
                ),
              )
            ],
          )),
    );
  }
}
