import 'package:doza_flutter/data/services/models/product_details/product_details_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/product_details/view_models/card_items_view_model.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatefulWidget {
  const TotalPrice(
      {super.key,
      required CardItemsViewModel cardItemViewModel,
      required ProductDetailsApiModel? productInfo})
      : _cardItemViewModel = cardItemViewModel,
        _productInfo = productInfo;

  final CardItemsViewModel _cardItemViewModel;
  final ProductDetailsApiModel? _productInfo;

  @override
  State<TotalPrice> createState() => _TotalPriceState();
}

class _TotalPriceState extends State<TotalPrice> {
  bool _isLoading = false;

  Future<void> handleAddToCart() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      await widget._cardItemViewModel.addToBasket();
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget._productInfo == null) return Text('Нет информации о товаре');
    return ListenableBuilder(
        listenable: widget._cardItemViewModel,
        builder: (context, _) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Container(
                color: AppColors.white1,
                child: Row(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget._productInfo!.volumeInfo.isNotEmpty
                              ? '${widget._cardItemViewModel.totalOrderCount.toString()} шт.'
                              : '1 шт.',
                          style:
                              TextStyle(color: AppColors.grey5, fontSize: 12),
                        ),
                        Text(
                          widget._productInfo!.volumeInfo.isNotEmpty
                              ? '${widget._cardItemViewModel.totalOrderPrice.toInt().toString()} ₽'
                              : '${widget._productInfo!.basePrice} ₽',
                          style: TextStyle(
                              color: AppColors.customBlue4, fontSize: 16),
                        )
                      ],
                    ),
                    if (widget._productInfo!.volumeInfo.isNotEmpty)
                      Expanded(
                          child: GestureDetector(
                              onTap: () => widget._cardItemViewModel.clear(),
                              child: Container(
                                height: 44,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                    color: AppColors.red2,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.delete_outline,
                                      size: 32,
                                      color: AppColors.white1,
                                    ),
                                    Text(
                                      'Очистить',
                                      style: TextStyle(
                                          color: AppColors.white1,
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              ))),
                    Expanded(
                        child: GestureDetector(
                      onTap: _isLoading ||
                              widget._cardItemViewModel.totalOrderCount == 0
                          ? null
                          : handleAddToCart,
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                            color: _isLoading ||
                                    widget._cardItemViewModel.totalOrderCount ==
                                        0
                                ? AppColors.customBlue.withValues(alpha: 0.5)
                                : AppColors.customBlue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_isLoading)
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.white1,
                                  ),
                                ),
                              )
                            else if (widget._cardItemViewModel.isErrorAddCart)
                              Icon(
                                Icons.priority_high,
                                color: AppColors.red1,
                              )
                            else
                              Icon(
                                Icons.delete_outline_outlined,
                                color: AppColors.white1,
                                size: 32,
                              ),
                            Text(
                              _isLoading ? 'Обработка...' : 'В корзину',
                              style: TextStyle(
                                  color: AppColors.white1, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ));
  }
}
