import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/orders_details/widgets/order_item.dart';
import 'package:doza_flutter/ui/view_models/orders_view_model.dart';
import 'package:doza_flutter/ui/widgets/arrow_left_icon.dart';
import 'package:doza_flutter/ui/widgets/scroll_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersDetailsScreen extends StatefulWidget {
  const OrdersDetailsScreen(
      {super.key, required OrdersViewModel ordersViewModel})
      : _ordersViewModel = ordersViewModel;

  final OrdersViewModel _ordersViewModel;

  @override
  State<OrdersDetailsScreen> createState() => _OrdersDetailsScreenState();
}

class _OrdersDetailsScreenState extends State<OrdersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 16),
          color: AppColors.white1,
          child: Row(
            spacing: 16,
            children: [
              ArrowLeftIcon(
                onClick: () => context.pop(),
                backgroundColor: AppColors.customBlue2,
                iconColor: AppColors.customBlue,
              ),
              Text(
                'История заказов',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
        Expanded(
            child: LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth,
            color: AppColors.customBlue2,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(14),
            child: ListenableBuilder(
              listenable: widget._ordersViewModel,
              builder: (context, child) => ScrollBarCustom(
                  child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                        itemCount: widget._ordersViewModel.orders.length,
                        itemBuilder: (context, index) {
                          final orderItem =
                              widget._ordersViewModel.orders[index];
                          if (widget._ordersViewModel.orders.isEmpty) {
                            return Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Нет активных заказов',
                                  style: TextStyle(fontSize: 20),
                                ));
                          }
                          return OrderItem(orderItem: orderItem);
                        },
                      ))),
            ),
          ),
        ))
      ],
    );
  }
}
