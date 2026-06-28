import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/product_details/view_models/card_items_view_model.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatefulWidget {
  const TotalPrice({super.key, required CardItemsViewModel cardItemViewModel})
      : _cardItemViewModel = cardItemViewModel;

  final CardItemsViewModel _cardItemViewModel;

  @override
  State<TotalPrice> createState() => _TotalPriceState();
}

class _TotalPriceState extends State<TotalPrice> {
  @override
  Widget build(BuildContext context) {
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
                          '${widget._cardItemViewModel.totalOrderCount.toString()} шт.',
                          style:
                              TextStyle(color: AppColors.grey5, fontSize: 12),
                        ),
                        Text(
                          '${widget._cardItemViewModel.totalOrderPrice.toInt().toString()} ₽',
                          style: TextStyle(
                              color: AppColors.customBlue4, fontSize: 16),
                        )
                      ],
                    ),
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
                                        color: AppColors.white1, fontSize: 14),
                                  )
                                ],
                              ),
                            ))),
                    Expanded(
                        child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                          color: AppColors.customBlue,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete_outline_outlined,
                            color: AppColors.white1,
                            size: 32,
                          ),
                          Text(
                            'В корзину',
                            style: TextStyle(
                                color: AppColors.white1, fontSize: 14),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ));
  }
}
