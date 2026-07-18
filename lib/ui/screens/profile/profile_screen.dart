import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/profile/view_models/profile_view_model.dart';
import 'package:doza_flutter/ui/screens/profile/widgets/additional_profile_info.dart/additional_profile_info.dart';
import 'package:doza_flutter/ui/screens/profile/widgets/profile_info/profile_info.dart';
import 'package:doza_flutter/ui/view_models/orders_view_model.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(
      {super.key,
      required ProfileViewModel profileViewModel,
      required OrdersViewModel ordersViewModel})
      : _profileViewModel = profileViewModel,
        _ordersViewModel = ordersViewModel;

  final ProfileViewModel _profileViewModel;
  final OrdersViewModel _ordersViewModel;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    widget._profileViewModel.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget._profileViewModel,
      builder: (context, child) => Skeletonizer(
          enabled: widget._profileViewModel.subscriptionStatus == null ||
              widget._profileViewModel.userInfo == null,
          child: Container(
            color: AppColors.white2,
            child: Column(
              children: [
                ProfileInfo(
                    ordersViewModel: widget._ordersViewModel,
                    profileViewModel: widget._profileViewModel),
                AdditionalProfileInfo(
                  orderViewModel: widget._ordersViewModel,
                )
              ],
            ),
          )),
    );
  }
}
