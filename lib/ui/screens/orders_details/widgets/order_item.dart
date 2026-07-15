import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/orders_details/widgets/order_product_item.dart';
import 'package:doza_flutter/ui/widgets/box_shadow_custom.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key, required OrdersListApiModel orderItem})
      : _orderItem = orderItem;

  final OrdersListApiModel _orderItem;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  OrdersListApiModel get orderItem => widget._orderItem;

  DateTime get dateNumber => orderItem.delivery.deliveryDate;

  String get date => DateFormat('MMMMd', 'ru').format(dateNumber);

  bool _isExpandedOrders = false;

  void toggleHideProducts() {
    setState(() {
      _isExpandedOrders = !_isExpandedOrders;
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
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 12,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.customBlue5,
                          borderRadius: BorderRadius.circular(18)),
                      child: Icon(
                        Icons.inventory_2_outlined,
                        color: AppColors.customBlue3,
                        size: 20,
                      ),
                    ),
                    Column(
                      spacing: 2,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Заказ №${orderItem.id}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          spacing: 4,
                          children: [
                            Icon(
                              Icons.timelapse_rounded,
                              color: AppColors.grey5,
                              size: 20,
                            ),
                            Text(
                              date,
                              style: TextStyle(
                                  color: AppColors.grey5, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  spacing: 12,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      spacing: 4,
                      children: [
                        Text(
                          '${orderItem.finalPrice.toString()}₽',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              boxShadow: BoxShadowCustom.shadow,
                              borderRadius: BorderRadius.circular(30),
                              color: switch (PreparationStatus.fromString(
                                  orderItem.preparationStatus)) {
                                PreparationStatus.processing =>
                                  AppColors.customBlue7,
                                PreparationStatus.shipped =>
                                  AppColors.customBlue8,
                                PreparationStatus.delivered => AppColors.green3,
                              }),
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                          child: Text(
                            PreparationStatus.fromString(
                                    orderItem.preparationStatus)
                                .displayName,
                            style: TextStyle(
                                fontSize: 12, color: AppColors.white1),
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: toggleHideProducts,
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: AnimatedRotation(
                          turns: _isExpandedOrders ? 0.5 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: Icon(
                            _isExpandedOrders
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_down_outlined,
                            color: AppColors.grey5,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.grey2,
            height: 1,
          ),
          AnimatedCrossFade(
              secondCurve: Curves.easeOutCubic,
              firstCurve: Curves.easeOutCubic,
              sizeCurve: Curves.easeOutCubic,
              firstChild: SizedBox.shrink(),
              secondChild: Column(
                children: orderItem.orderItems
                    .map((item) => OrderProductItem(orderProductItem: item))
                    .toList(),
              ),
              crossFadeState: _isExpandedOrders
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 300))
        ],
      ),
    );
  }
}
          //  AnimatedList.separated(
          //     initialItemCount: orderItem.orderItems.length,
          //     removedSeparatorBuilder: (context, index, animation) =>
          //         const Divider(
          //       color: Colors.transparent,
          //     ),
          //     separatorBuilder: (context, index, animation) {
          //       // ← третий параметр animation
          //       return SizeTransition(
          //         sizeFactor: animation,
          //         child: Divider(color: AppColors.green2, height: 1),
          //       );
          //     },
          //     itemBuilder: (context, index, animation) {
          //       // ← третий параметр animation
          //       return SizeTransition(
          //         sizeFactor: animation,
          //         child: OrderProductItem(
          //             orderProductItem: orderItem.orderItems[index]),
          //       );
          //     },
          //   )