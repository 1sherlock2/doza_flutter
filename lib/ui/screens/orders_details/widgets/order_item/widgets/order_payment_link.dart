import 'package:doza_flutter/data/services/models/orders_list/orders_list_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/view_models/orders_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPaymentLink extends StatefulWidget {
  const OrderPaymentLink({super.key, required OrdersListApiModel orderItem})
      : _orderItem = orderItem;

  final OrdersListApiModel _orderItem;

  @override
  State<OrderPaymentLink> createState() => _OrderPaymentLinkState();
}

class _OrderPaymentLinkState extends State<OrderPaymentLink> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
          style: ButtonStyle(
              padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
              backgroundColor: WidgetStateProperty.fromMap({
                WidgetState.any: AppColors.green2,
                WidgetState.pressed: AppColors.green6
              })),
          onPressed: () => context
              .read<OrdersViewModel>()
              .openPaymentLink(widget._orderItem.payments.confirmedUrl),
          child: Text('Оплатить', style: TextStyle(color: AppColors.white1))),
    );
  }
}
