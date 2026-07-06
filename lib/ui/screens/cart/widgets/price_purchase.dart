import 'package:doza_flutter/routing/routes.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/cart/view_models/cart_view_model.dart';
import 'package:doza_flutter/ui/view_models/cart_state_notifier.dart';
import 'package:doza_flutter/ui/widgets/icon_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PricePurchase extends StatefulWidget {
  const PricePurchase({super.key, required CartViewModel cartViewModel})
      : _cartViewModel = cartViewModel;

  final CartViewModel _cartViewModel;

  @override
  State<PricePurchase> createState() => _PricePurchaseState();
}

class _PricePurchaseState extends State<PricePurchase> {
  void _handleClickPurchase() {
    if (widget._cartViewModel.selectedCartItemIds.isEmpty) return;
    context
        .read<CartStateNotifier>()
        .handleSelectedCartByPayment(widget._cartViewModel.selectedCartItemIds);
    context.push(Routes.additionalInfoPayment);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white1,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text(
                'Выбрано ${widget._cartViewModel.selectedCartItemIds.length}',
                style: TextStyle(color: AppColors.grey5, fontSize: 12),
              ),
              Text(
                '${widget._cartViewModel.totalPrice()} ₽',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          ),
          Expanded(
              child: IconButtonCustom(
            onClick: _handleClickPurchase,
            icon: Icons.shopping_cart_outlined,
            text: 'Оформить заказ',
            color: AppColors.white1,
            backgroundColor:
                widget._cartViewModel.selectedCartItemIds.isNotEmpty
                    ? AppColors.customBlue3
                    : AppColors.customBlue7,
            overlayColor: widget._cartViewModel.selectedCartItemIds.isNotEmpty
                ? AppColors.customBlue4
                : null,
          ))
        ],
      ),
    );
  }
}
