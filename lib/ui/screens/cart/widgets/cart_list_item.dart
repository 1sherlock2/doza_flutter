import 'package:doza_flutter/data/services/models/cart_item/cart_item_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';

class CartListItem extends StatefulWidget {
  const CartListItem({
    super.key,
    required bool selected,
    required CartItemApiModel cartItem,
    required void Function(bool?) handleSelectedChange,
    required void Function(int cartItemId) showRemoveCartItem,
  })  : _cartItem = cartItem,
        _handleSelectedChange = handleSelectedChange,
        _selected = selected,
        _showRemoveCartItem = showRemoveCartItem;

  final void Function(int cartItemId) _showRemoveCartItem;
  final bool _selected;
  final CartItemApiModel _cartItem;
  final Function(bool?) _handleSelectedChange;

  @override
  State<CartListItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white1,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 4,
              offset: const Offset(0, 2),
            )
          ]),
      padding: const EdgeInsets.only(bottom: 14, right: 10, top: 14),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Checkbox(
                      side: BorderSide(
                        color: AppColors.grey5!, // цвет рамки
                        width: 1.5, // толщина
                      ),
                      activeColor: AppColors.customBlue,
                      value: widget._selected,
                      onChanged: widget._handleSelectedChange),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  child: Image.network(
                    widget._cartItem.imageUrl,
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${widget._cartItem.productName} (${widget._cartItem.volumeMl}мл)',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Text(
                          '${widget._cartItem.price * widget._cartItem.quantity}₽',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        Text(
                          '${widget._cartItem.quantity} шт × ${widget._cartItem.price}',
                          style:
                              TextStyle(color: AppColors.grey5, fontSize: 12),
                        ),
                      ],
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            decoration: BoxDecoration(
                                color: AppColors.red3,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            child: InkWell(
                                onTap: () => widget._showRemoveCartItem(
                                    widget._cartItem.cartItemId),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                overlayColor:
                                    WidgetStateProperty<Color>.fromMap(
                                        {WidgetState.pressed: AppColors.red4}),
                                child: SizedBox(
                                  height: 34,
                                  width: 34,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    spacing: 4,
                                    children: [
                                      Icon(
                                        Icons.delete_outline_outlined,
                                        color: AppColors.red1,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ))
                  ],
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// GestureDetector(
//                         onTap: () => widget
//                             ._showRemoveCartItem(widget._cartItem.cartItemId),
//                         child: Container(
//                           width: 34,
//                           padding: EdgeInsets.all(4),
//                           alignment: Alignment.bottomRight,
//                           decoration: BoxDecoration(
//                               color: AppColors.red3,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(10),
//                               )),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             spacing: 4,
//                             children: [
//                               Icon(
//                                 Icons.delete_outline_outlined,
//                                 color: AppColors.red1,
//                                 size: 24,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
