import 'package:doza_flutter/data/services/models/product_details/product_details_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/product_details/models/volume_card_item_ui_model.dart';
import 'package:doza_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class VolumeInfoCount extends StatefulWidget {
  const VolumeInfoCount(
      {super.key,
      required VolumeCardItemUiModel cardItem,
      required VolumeInfoApiModel volumeInfo,
      required void Function(CardAction action) onChange})
      : _volumeInfo = volumeInfo,
        _onChanged = onChange,
        _cardItemState = cardItem;

  final VolumeInfoApiModel _volumeInfo;
  final void Function(CardAction action) _onChanged;
  final VolumeCardItemUiModel _cardItemState;
  @override
  State<VolumeInfoCount> createState() => _VolumeInfoCountState();
}

class _VolumeInfoCountState extends State<VolumeInfoCount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: AppColors.white1,
          boxShadow: [
            BoxShadow(
                color: AppColors.grey4!,
                offset: Offset(0, 1),
                blurStyle: BlurStyle.outer)
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.customBlue5,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      child: Column(
                        children: [
                          Text(
                            widget._volumeInfo.volumeMl.toString(),
                            style: TextStyle(
                                color: AppColors.customBlue4,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'мл',
                            style: TextStyle(
                                color: AppColors.customBlue4,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    child: Column(
                      children: [
                        Text(
                          '${widget._volumeInfo.price.toString()} ₽',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'за шт.',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  IconButton(
                    style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.all(1)),
                        backgroundColor:
                            WidgetStateProperty.all(AppColors.customBlue2),
                        iconColor:
                            WidgetStateProperty.all(AppColors.customBlue)),
                    onPressed: () => widget._onChanged(CardAction.decrement),
                    icon: Icon(
                      Icons.remove,
                      size: 26,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Text(
                      '${widget._cardItemState.count}',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.customBlue,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  IconButton(
                    style: ButtonStyle(
                        padding: WidgetStateProperty.all(EdgeInsets.all(1)),
                        backgroundColor:
                            WidgetStateProperty.all(AppColors.customBlue2),
                        iconColor:
                            WidgetStateProperty.all(AppColors.customBlue)),
                    onPressed: () => widget._onChanged(CardAction.increment),
                    icon: Icon(
                      Icons.add,
                      size: 26,
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Divider(
              color: AppColors.grey3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '${widget._cardItemState.count} шт × ${widget._volumeInfo.price}'),
              Text(
                '${widget._cardItemState.totalPrice.toInt()} ₽',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          )
        ],
      ),
    );
  }
}
