import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/view_models/additional_payment_info_view_model.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/widgets/product_info_payment.dart';
import 'package:doza_flutter/ui/widgets/arrow_left_icon.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white2,
      child: Column(
        children: [
          Container(
            color: AppColors.white1,
            padding: EdgeInsets.only(top: 44, left: 16, right: 16, bottom: 10),
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
          ListenableBuilder(
            listenable: widget._additionalPaymentInfoViewModel,
            builder: (context, child) => Expanded(
                child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  ProductInfoPayment(
                    additionalPaymentInfoViewModel:
                        widget._additionalPaymentInfoViewModel,
                  )
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
