import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
import 'package:doza_flutter/enums/payment_status.dart';
import 'package:doza_flutter/enums/preparation_status.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/orders_details/widgets/order_item/widgets/address_delivery.dart';
import 'package:doza_flutter/ui/screens/orders_details/widgets/order_item/widgets/created_delivery_date.dart';
import 'package:doza_flutter/ui/screens/orders_details/widgets/order_item/widgets/order_expires_timer.dart';
import 'package:doza_flutter/ui/screens/orders_details/widgets/order_item/widgets/order_item_count_price.dart';
import 'package:doza_flutter/ui/screens/orders_details/widgets/order_item/widgets/order_payment_link.dart';
import 'package:doza_flutter/ui/widgets/box_shadow_custom.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key, required OrdersListApiModel orderItem})
      : _orderItem = orderItem;

  final OrdersListApiModel _orderItem;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  OrdersListApiModel get orderItem => widget._orderItem;

  bool _isExpiredOrders = false;

  void toggleHideProducts() {
    setState(() {
      _isExpiredOrders = !_isExpiredOrders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: BoxShadowCustom.shadow,
          color: AppColors.white1,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.customBlue,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      color: AppColors.white1,
                      size: 20,
                    ),
                    Text(
                      'Заказ №${orderItem.id}',
                      style: TextStyle(fontSize: 14, color: AppColors.white1),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: BoxShadowCustom.shadow,
                      borderRadius: BorderRadius.circular(30),
                      color: switch (PreparationStatus.fromString(
                          orderItem.preparationStatus)) {
                        PreparationStatus.processing => AppColors.customBlue7,
                        PreparationStatus.shipped => AppColors.customBlue8,
                        PreparationStatus.delivered => AppColors.green3,
                      }),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: orderItem.status == PaymentStatus.pending
                      ? OrderExpiresTimer(
                          expiresAt: orderItem.expiresAt,
                          onExpired: () {
                            setState(() {
                              _isExpiredOrders = true;
                            });
                          },
                        )
                      : Text(
                          PreparationStatus.fromString(
                                  orderItem.preparationStatus)
                              .displayName,
                          style:
                              TextStyle(fontSize: 12, color: AppColors.white1),
                        ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.white1,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(
              spacing: 16,
              children: [
                CreatedDeliveryDate(orderItem: orderItem),
                AddressDelivery(orderItem: orderItem),
                OrderItemCountPrice(orderItem: orderItem),
                if (orderItem.status == PaymentStatus.pending &&
                    !_isExpiredOrders)
                  OrderPaymentLink(orderItem: orderItem)
              ],
            ),
          )
        ],
      ),
    );
  }
}
