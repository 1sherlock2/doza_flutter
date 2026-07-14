import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/profile/view_models/profile_view_model.dart';
import 'package:doza_flutter/ui/screens/profile/widgets/profile_info/widgets/user_info_balance_and_orders.dart';
import 'package:doza_flutter/ui/view_models/orders_view_model.dart';
import 'package:doza_flutter/utils/pluralize.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo(
      {super.key,
      required OrdersViewModel ordersViewModel,
      required ProfileViewModel profileViewModel})
      : _profileViewModel = profileViewModel,
        _ordersViewModel = ordersViewModel;

  final ProfileViewModel _profileViewModel;
  final OrdersViewModel _ordersViewModel;
  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.customBlue,
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 24),
          child: Column(
            spacing: 16,
            children: [
              Row(
                spacing: 20,
                children: [
                  Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.customBlue3,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.account_circle_outlined,
                      color: AppColors.white2,
                      size: 40,
                    ),
                  ),
                  Column(
                    spacing: 8,
                    children: [
                      Text(
                        'Мой профиль',
                        style: TextStyle(color: AppColors.white2, fontSize: 20),
                      ),
                      Row(
                        spacing: 8,
                        children: [
                          Icon(
                            Icons.phone_outlined,
                            color: AppColors.white2,
                            size: 24,
                          ),
                          Text(
                            widget._profileViewModel.userInfo != null
                                ? widget._profileViewModel.userInfo!.phone
                                    .toString()
                                : '',
                            style: TextStyle(
                                color: AppColors.white2, fontSize: 16),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                spacing: 10,
                children: [
                  if (widget._profileViewModel.userInfo != null)
                    Expanded(
                      child: UserInfoBalanceAndOrders(
                        title: 'Баланс',
                        info:
                            '${widget._profileViewModel.userInfo!.balance.toString()}₽',
                        icon: Icons.wallet_outlined,
                      ),
                    ),
                  if (widget._profileViewModel.userInfo != null &&
                      widget._profileViewModel.subscriptionStatus != null)
                    Expanded(
                        child: UserInfoBalanceAndOrders(
                      info: widget._profileViewModel.subscriptionStatus!
                                  .status ==
                              'active'
                          ? '${widget._profileViewModel.subscriptionStatus!.discountPercent.toString()}%'
                          : '${widget._profileViewModel.userInfo!.bonusBalance.toString()}₽',
                      icon: Icons.control_point_duplicate_sharp,
                      title:
                          widget._profileViewModel.subscriptionStatus!.status ==
                                  'active'
                              ? 'Скидка'
                              : 'Бонусы',
                    )),
                  Expanded(
                    child: ListenableBuilder(
                      listenable: widget._ordersViewModel,
                      builder: (context, child) {
                        return UserInfoBalanceAndOrders(
                            icon: Icons.shopping_bag_outlined,
                            info: widget._ordersViewModel.orders.length
                                .toString(),
                            title: pluralize(
                                widget._ordersViewModel.orders.length,
                                ['Заказ', "Заказа", "Заказов"]));
                      },
                    ),
                  )
                ],
              )

              // if (widget._profileViewModel.userInfo != null)
              //   UserInfoBalanceAndOrders(
              //     title: 'Баланс',
              //     info: widget._profileViewModel.userInfo!.balance.toString(),
              //     icon: Icon(
              //       Icons.wallet_outlined,
              //       color: AppColors.white2,
              //       size: 24,
              //     ),
              //   )
            ],
          ),
        ));
  }
}
