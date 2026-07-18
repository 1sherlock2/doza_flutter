import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreatedDeliveryDate extends StatefulWidget {
  const CreatedDeliveryDate({super.key, required OrdersListApiModel orderItem})
      : _orderItem = orderItem;

  final OrdersListApiModel _orderItem;

  @override
  State<CreatedDeliveryDate> createState() => _CreatedDeliveryDateState();
}

class _CreatedDeliveryDateState extends State<CreatedDeliveryDate> {
  OrdersListApiModel get orderItem => widget._orderItem;

  String get deliveryDate => DateFormat('MMMMd', 'ru')
      .format(orderItem.delivery.deliveryDate.toLocal());

  String get deliveryTime => orderItem.delivery.estimatedDeliveryTime;

  String get createdDate =>
      DateFormat('MMMMd', 'ru').format(orderItem.createdAt);
  String get createdTime => DateFormat('Hm', 'ru').format(orderItem.createdAt);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
            child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.customBlue2,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.timelapse_rounded,
                    color: AppColors.grey5,
                    size: 20,
                  ),
                  Text(
                    'Оформлен',
                    style: TextStyle(color: AppColors.grey5),
                  )
                ],
              ),
              Row(
                spacing: 4,
                children: [
                  Text(
                    createdDate,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    createdTime,
                    style: TextStyle(fontSize: 12, color: AppColors.grey5),
                  )
                ],
              )
            ],
          ),
        )),
        Expanded(
            child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.customBlue2,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            spacing: 4,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 4,
                children: [
                  Icon(
                    Icons.delivery_dining_outlined,
                    color: AppColors.grey5,
                    size: 20,
                  ),
                  Text(
                    'Доставка',
                    style: TextStyle(color: AppColors.grey5),
                  )
                ],
              ),
              Row(
                spacing: 4,
                children: [
                  Text(
                    deliveryDate,
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    deliveryTime,
                    style: TextStyle(fontSize: 12, color: AppColors.grey5),
                  )
                ],
              )
            ],
          ),
        ))
      ],
    );
  }
}
