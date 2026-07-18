import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/orders_details/widgets/order_item/widgets/order_product_item.dart';
import 'package:doza_flutter/utils/pluralize.dart';
import 'package:flutter/material.dart';

class OrderItemCountPrice extends StatefulWidget {
  const OrderItemCountPrice({super.key, required OrdersListApiModel orderItem})
      : _orderItem = orderItem;

  final OrdersListApiModel _orderItem;

  @override
  State<OrderItemCountPrice> createState() => _OrderItemCountPriceState();
}

class _OrderItemCountPriceState extends State<OrderItemCountPrice> {
  OrdersListApiModel get orderItem => widget._orderItem;
  int get itemsCount => orderItem.orderItems.length;

  bool _isExpandedOrders = false;

  void toggleHideProducts() {
    setState(() {
      _isExpandedOrders = !_isExpandedOrders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: AppColors.customBlue1,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$itemsCount ${pluralize(itemsCount, [
                        'позиция',
                        "позиции",
                        "позиций"
                      ])}',
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  spacing: 10,
                  children: [
                    Text(
                      '${orderItem.finalPrice.toString()}₽',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
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
                    ),
                  ],
                )
              ],
            ),
          ),
          AnimatedCrossFade(
              secondCurve: Curves.easeOutCubic,
              firstCurve: Curves.easeOutCubic,
              sizeCurve: Curves.easeOutCubic,
              firstChild: SizedBox.shrink(),
              secondChild: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Divider(
                      color: AppColors.customBlue7,
                      height: 1,
                    ),
                    ...orderItem.orderItems
                        .map((item) => OrderProductItem(orderProductItem: item))
                  ],
                ),
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
