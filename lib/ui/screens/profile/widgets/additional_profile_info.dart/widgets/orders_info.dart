import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/view_models/orders_view_model.dart';
import 'package:doza_flutter/utils/pluralize.dart';
import 'package:flutter/material.dart';

class OrdersInfo extends StatefulWidget {
  const OrdersInfo({super.key, required OrdersViewModel ordersViewModel})
      : _ordersViewModel = ordersViewModel;

  final OrdersViewModel _ordersViewModel;

  @override
  State<OrdersInfo> createState() => _OrdersInfoState();
}

class _OrdersInfoState extends State<OrdersInfo> {
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
                  Icons.inventory_2_outlined,
                  color: AppColors.customBlue3,
                  size: 24,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Мои заказы',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                      style: TextStyle(color: AppColors.grey5, fontSize: 12),
                      '${widget._ordersViewModel.orders.length} ${pluralize(widget._ordersViewModel.orders.length, [
                            'заказ',
                            'заказа',
                            'заказов'
                          ])}'),
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
