import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
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
      padding: EdgeInsets.only(top: 14, left: 36, bottom: 10, right: 10),
      child: Text(widget._orderProductItem.productVariant.product.name),
    );
  }
}
