import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/profile/profile_view_model.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({super.key, required ProfileViewModel profileViewModel})
      : _profileViewModel = profileViewModel;

  final ProfileViewModel _profileViewModel;
  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.customBlue,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 24),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(14),
                  // decoration: BoxDecoration(
                  //   color: AppColors.customBlue7,
                  //   borderRadius: BorderRadius.circular(12),
                  // ),
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: AppColors.red1, // тёмный оттенок
                    size: 40,
                  ),
                ),
                Icon(
                  Icons.ac_unit,
                  size: 30,
                  color: AppColors.red1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
