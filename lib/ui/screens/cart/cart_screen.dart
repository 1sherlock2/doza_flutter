import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/cart/view_models/cart_view_model.dart';
import 'package:doza_flutter/ui/screens/cart/widgets/cart_bar.dart';
import 'package:doza_flutter/ui/screens/cart/widgets/cart_list_item.dart';
import 'package:doza_flutter/ui/screens/cart/widgets/price_purchase.dart';
import 'package:doza_flutter/ui/widgets/modal_agree.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required CartViewModel cartViewModel})
      : _cartViewModel = cartViewModel;

  final CartViewModel _cartViewModel;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _log = Logger('CartScreenState');

  bool _isShowModalRemoveCartItem = false;
  int? _cartItemIdByDelete;
  bool _isShowModalRemoveSelectedCartItem = false;

  void _showRemoveCartItem(int cartItemId) {
    setState(() {
      _cartItemIdByDelete = cartItemId;
      _isShowModalRemoveCartItem = true;
    });
  }

  void _showRemoveSelectedCartItem() {
    setState(() {
      _isShowModalRemoveSelectedCartItem = true;
    });
  }

  void _handleClickRemoveSelectedCartItem() {
    if (widget._cartViewModel.selectedCartItemIds.isEmpty) return;
    widget._cartViewModel.handleDeleteSelected();
    setState(() {
      _isShowModalRemoveSelectedCartItem = false;
    });
  }

  void _handleClickRemoveCartItem() {
    if (_cartItemIdByDelete == null) return;
    widget._cartViewModel.deleteOneProduct(cartItemId: _cartItemIdByDelete!);
    setState(() {
      _cartItemIdByDelete = null;
      _isShowModalRemoveCartItem = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget._cartViewModel,
        builder: (context, state) {
          return Skeletonizer(
              enabled: widget._cartViewModel.cartItems.isEmpty,
              child: Stack(
                children: [
                  Container(
                    color: AppColors.white2,
                    child: SafeArea(
                      bottom: false,
                      child: Column(
                        children: [
                          CartBar(
                            showRemoveSelectedCartItem:
                                _showRemoveSelectedCartItem,
                            cartViewModel: widget._cartViewModel,
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 10, top: 16),
                            child: ScrollbarTheme(
                                data: ScrollbarThemeData(
                                    thumbColor:
                                        WidgetStateProperty<Color>.fromMap({
                                  WidgetState.any: AppColors.customBlue7,
                                  WidgetState.scrolledUnder:
                                      AppColors.customBlue7,
                                  WidgetState.dragged: AppColors.customBlue4
                                })),
                                child: Scrollbar(
                                    thumbVisibility: true,
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10),
                                        child: ListView.separated(
                                            itemCount: widget._cartViewModel
                                                .cartItems.length,
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                                      height: 10,
                                                    ),
                                            itemBuilder: (context, index) {
                                              final cartItem = widget
                                                  ._cartViewModel
                                                  .cartItems[index];
                                              final selected = widget
                                                  ._cartViewModel
                                                  .selectedCartItemIds
                                                  .contains(
                                                      cartItem.cartItemId);
                                              return CartListItem(
                                                showRemoveCartItem:
                                                    _showRemoveCartItem,
                                                selected: selected,
                                                cartItem: cartItem,
                                                handleSelectedChange: widget
                                                    ._cartViewModel
                                                    .handleSelectedChange(
                                                        cartItem.cartItemId),
                                              );
                                            })))),
                          )),
                          PricePurchase(cartViewModel: widget._cartViewModel)
                        ],
                      ),
                    ),
                  ),
                  ModalAgree(
                      title:
                          'Вы действительно хотите удалить выбранные товары?',
                      open: _isShowModalRemoveSelectedCartItem,
                      onClose: () => setState(
                          () => _isShowModalRemoveSelectedCartItem = false),
                      onAgree: _handleClickRemoveSelectedCartItem),
                  ModalAgree(
                      open: _isShowModalRemoveCartItem,
                      title:
                          'Вы действительно хотите удалить товар из корзины?',
                      onClose: () =>
                          setState(() => _isShowModalRemoveCartItem = false),
                      onAgree: _handleClickRemoveCartItem),
                ],
              ));
        });
  }
}
