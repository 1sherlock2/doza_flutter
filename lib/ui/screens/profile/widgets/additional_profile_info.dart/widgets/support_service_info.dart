import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class SupportServiceInfo extends StatefulWidget {
  const SupportServiceInfo({super.key});

  @override
  State<SupportServiceInfo> createState() => _SupportServiceInfoState();
}

class _SupportServiceInfoState extends State<SupportServiceInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 16,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.customBlue5,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  Icons.support_agent_outlined,
                  color: AppColors.customBlue3,
                  size: 24,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Служба поддержки',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                      style: TextStyle(color: AppColors.grey5, fontSize: 12),
                      'Чат, телефон, e-mail'),
                ],
              )
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            color: AppColors.customBlue7,
            size: 24,
          )
        ],
      ),
    );
  }
}
