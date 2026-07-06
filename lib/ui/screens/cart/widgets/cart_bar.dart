import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/cart/view_models/cart_view_model.dart';
import 'package:doza_flutter/ui/widgets/icon_button_custom.dart';
import 'package:flutter/material.dart';

class CartBar extends StatefulWidget {
  const CartBar(
      {super.key,
      required CartViewModel cartViewModel,
      required void Function() showRemoveSelectedCartItem})
      : _cartViewModel = cartViewModel,
        _showRemoveSelectedCartItem = showRemoveSelectedCartItem;

  final CartViewModel _cartViewModel;
  final void Function() _showRemoveSelectedCartItem;

  @override
  State<CartBar> createState() => _CartBarState();
}

class _CartBarState extends State<CartBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 16,
            children: [
              IconButtonCustom(
                onClick: widget._cartViewModel.handleSelectedAll,
                text: 'Выбрать все',
                color: AppColors.white1,
                backgroundColor: AppColors.customBlue3,
                overlayColor: AppColors.customBlue4,
              ),
              IconButtonCustom(
                onClick: widget._cartViewModel.handleClearAll,
                text: 'Очистить все',
                color: AppColors.white1,
                backgroundColor: AppColors.customBlue3,
                overlayColor: AppColors.customBlue4,
              )
            ],
          ),
          if (widget._cartViewModel.selectedCartItemIds.isNotEmpty)
            IconButtonCustom(
              onClick: widget._showRemoveSelectedCartItem,
              text: 'Удалить',
              color: AppColors.white1,
              backgroundColor: AppColors.red4,
              overlayColor: AppColors.red1,
            )
        ],
      ),
    );
  }
}
