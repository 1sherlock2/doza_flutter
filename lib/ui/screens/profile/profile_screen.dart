import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/profile/profile_view_model.dart';
import 'package:doza_flutter/ui/screens/profile/widgets/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required ProfileViewModel profileViewModel})
      : _profileViewModel = profileViewModel;

  final ProfileViewModel _profileViewModel;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: widget._profileViewModel.subscriptionStatus == null ||
            widget._profileViewModel.userInfo == null,
        child: Container(
          color: AppColors.white2,
          child: Column(
            children: [ProfileInfo(profileViewModel: widget._profileViewModel)],
          ),
        ));
  }
}
