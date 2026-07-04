import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/cart/view_models/cart_view_model.dart';
import 'package:doza_flutter/ui/screens/cart/widgets/cart_list_item.dart';
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

  final Set<int> _selectedCartItemIds = {};

  bool _isShowModalRemoveCartItem = false;
  int? _cartItemIdByDelete;

  void _showRemoveCartItem(int cartItemId) {
    setState(() {
      _cartItemIdByDelete = cartItemId;
      _isShowModalRemoveCartItem = true;
    });
    _log.info({_cartItemIdByDelete});
  }

  void _handleClickRemoveCartItem() {
    if (_cartItemIdByDelete == null) return;
    widget._cartViewModel.deleteOneProduct(cartItemId: _cartItemIdByDelete!);
    setState(() {
      _cartItemIdByDelete = null;
      _isShowModalRemoveCartItem = false;
    });
  }

  Function(bool?) handleSelectedChange(int value) {
    return (bool? selected) {
      setState(() {
        if (_selectedCartItemIds.contains(value)) {
          _selectedCartItemIds.remove(value);
        } else {
          _selectedCartItemIds.add(value);
        }
      });
    };
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
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 20),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Scrollbar(
                                      thumbVisibility: true,
                                      child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
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
                                                final selected =
                                                    _selectedCartItemIds
                                                        .contains(cartItem
                                                            .cartItemId);
                                                return CartListItem(
                                                  showRemoveCartItem:
                                                      _showRemoveCartItem,
                                                  selected: selected,
                                                  cartItem: cartItem,
                                                  handleSelectedChange:
                                                      handleSelectedChange(
                                                          cartItem.cartItemId),
                                                );
                                              }))))
                            ],
                          ),
                        )),
                  ),
                  ModalAgree(
                      open: _isShowModalRemoveCartItem,
                      onClose: () =>
                          setState(() => _isShowModalRemoveCartItem = false),
                      onAgree: _handleClickRemoveCartItem),
                ],
              ));
        });
  }
}
