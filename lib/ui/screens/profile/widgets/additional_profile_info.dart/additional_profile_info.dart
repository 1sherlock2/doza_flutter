import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/profile/widgets/additional_profile_info.dart/widgets/orders_info.dart';
import 'package:doza_flutter/ui/screens/profile/widgets/additional_profile_info.dart/widgets/support_service_info.dart';
import 'package:doza_flutter/ui/view_models/orders_view_model.dart';
import 'package:flutter/material.dart';

class AdditionalProfileInfo extends StatefulWidget {
  const AdditionalProfileInfo(
      {super.key, required OrdersViewModel orderViewModel})
      : _ordersViewModel = orderViewModel;

  final OrdersViewModel _ordersViewModel;

  @override
  State<AdditionalProfileInfo> createState() => _AdditionalProfileInfoState();
}

class _AdditionalProfileInfoState extends State<AdditionalProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) => Container(
          width: constraints.maxWidth,
          color: AppColors.customBlue2,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(16),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white1,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OrdersInfo(
                  ordersViewModel: widget._ordersViewModel,
                ),
                Divider(
                  color: AppColors.grey2,
                  height: 1,
                ),
                SupportServiceInfo()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
