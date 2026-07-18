import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class OrderProductItem extends StatefulWidget {
  const OrderProductItem(
      {super.key, required OrdersListItemApiModel orderProductItem})
      : _orderProductItem = orderProductItem;

  final OrdersListItemApiModel _orderProductItem;

  @override
  State<OrderProductItem> createState() => _OrderProductItemState();
}

class _OrderProductItemState extends State<OrderProductItem> {
  OrdersListItemApiModel get orderProductItem => widget._orderProductItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 14, bottom: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(
                    orderProductItem.productVariant.product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${orderProductItem.productVariant.product.name} (${orderProductItem.productVariant.volumeMl}мл)'),
                    Text(
                      '${orderProductItem.quantity} шт × ${orderProductItem.pricePerUnit}₽',
                      style: TextStyle(color: AppColors.grey5, fontSize: 12),
                    )
                  ],
                )
              ],
            ),
            Text(
              '${orderProductItem.subtotal}₽',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            )
          ],
        ));
  }
}
