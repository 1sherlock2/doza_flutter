import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class AddressDelivery extends StatefulWidget {
  const AddressDelivery({super.key, required OrdersListApiModel orderItem})
      : _orderItem = orderItem;
  final OrdersListApiModel _orderItem;

  @override
  State<AddressDelivery> createState() => _AddressDeliveryState();
}

class _AddressDeliveryState extends State<AddressDelivery> {
  OrdersListApiModel get orderItem => widget._orderItem;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.customBlue2,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              spacing: 4,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 24,
                  color: AppColors.grey5,
                ),
                Text(
                  'Адрес доставки',
                  style: TextStyle(fontSize: 14, color: AppColors.grey5),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 28),
              child: Text(
                '${orderItem.delivery.city.city}, ${orderItem.delivery.address}',
                softWrap: true,
              ),
            )
          ],
        ));
  }
}
