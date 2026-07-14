import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/additional_payment_info/view_models/additional_payment_info_view_model.dart';
import 'package:doza_flutter/ui/widgets/box_shadow_custom.dart';
import 'package:doza_flutter/utils/pluralize.dart';
import 'package:flutter/material.dart';

class ProductInfoPayment extends StatefulWidget {
  const ProductInfoPayment(
      {super.key,
      required AdditionalPaymentInfoViewModel additionalPaymentInfoViewModel})
      : _additionalPaymentInfoViewModel = additionalPaymentInfoViewModel;

  final AdditionalPaymentInfoViewModel _additionalPaymentInfoViewModel;

  @override
  State<ProductInfoPayment> createState() => _ProductInfoPaymentState();
}

class _ProductInfoPaymentState extends State<ProductInfoPayment> {
  bool _isExpandedProducts = false;
  final int _countByHide = 3;

  void toggleHideProducts() {
    setState(() {
      _isExpandedProducts = !_isExpandedProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              boxShadow: BoxShadowCustom.shadow,
              color: AppColors.white1,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: LayoutBuilder(
            builder: (context, constraints) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 12,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.grey1,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Icon(
                            Icons.inventory_2_outlined,
                            color: AppColors.customBlue,
                            size: 24,
                          ),
                        ),
                        Column(
                          spacing: 4,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: 10,
                              children: [
                                Text(
                                  'Ваш заказ',
                                  style: TextStyle(
                                      color: AppColors.customBlue,
                                      fontSize: 14),
                                ),
                                Text('-'),
                                Text(
                                  '${widget._additionalPaymentInfoViewModel.selectedCartItems.length} ${pluralize(widget._additionalPaymentInfoViewModel.selectedCartItems.length, [
                                        'позиция',
                                        'позиции',
                                        'позиций'
                                      ])}',
                                  style: TextStyle(color: AppColors.customBlue),
                                )
                              ],
                            ),
                            Text(
                              '${widget._additionalPaymentInfoViewModel.productsPrice}₽',
                              style: TextStyle(color: AppColors.grey5),
                            ),
                          ],
                        )
                      ],
                    ),
                    widget._additionalPaymentInfoViewModel.selectedCartItems
                                .length >
                            3
                        ? _isExpandedProducts
                            ? GestureDetector(
                                onTap: toggleHideProducts,
                                child: Icon(
                                  Icons.keyboard_arrow_up_outlined,
                                  color: AppColors.grey5,
                                ),
                              )
                            : GestureDetector(
                                onTap: toggleHideProducts,
                                child: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: AppColors.grey5,
                                ),
                              )
                        : SizedBox.shrink()
                  ],
                ),
                Divider(
                  color: AppColors.grey2,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14),
                  child: Column(
                    spacing: 10,
                    children: widget
                        ._additionalPaymentInfoViewModel.selectedCartItems
                        .take(!_isExpandedProducts
                            ? _countByHide
                            : widget._additionalPaymentInfoViewModel
                                .selectedCartItems.length)
                        .map(
                          (item) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                  item.imageUrl,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 2,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          '${item.productName} (${item.volumeMl}мл)'),
                                      Text(
                                        '${item.price * item.quantity}₽',
                                        style: TextStyle(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  Text(
                                    '${item.quantity} шт',
                                    style: TextStyle(color: AppColors.grey5),
                                  )
                                ],
                              ))
                            ],
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ),
        ),
        if (!_isExpandedProducts &&
            widget._additionalPaymentInfoViewModel.selectedCartItems.length >
                _countByHide)
          Padding(
            padding: EdgeInsets.only(top: 4),
            child: Text(
                '+ еще ${widget._additionalPaymentInfoViewModel.selectedCartItems.length - _countByHide} ${pluralize(widget._additionalPaymentInfoViewModel.selectedCartItems.length - _countByHide, [
                  'позиция',
                  'позиции',
                  'позиций'
                ])}'),
          )
      ],
    );
  }
}
