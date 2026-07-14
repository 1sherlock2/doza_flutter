import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class UserInfoBalanceAndOrders extends StatelessWidget {
  final IconData icon;
  final String title;
  final String info;

  const UserInfoBalanceAndOrders(
      {super.key, required this.icon, required this.info, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.customBlue3,
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Column(
        spacing: 4,
        children: [
          Icon(
            icon,
            color: AppColors.white2,
            size: 24,
          ),
          Text(
            info,
            style: TextStyle(
                color: AppColors.white2,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          Text(title,
              style: TextStyle(
                  color: AppColors.grey1,
                  fontSize: 14,
                  fontWeight: FontWeight.w400))
        ],
      ),
    );
  }
}
