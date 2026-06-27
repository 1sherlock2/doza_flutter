import 'package:doza_flutter/data/services/models/product_details/product_details_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/product_details/models/volume_card_item_ui_model.dart';
import 'package:doza_flutter/ui/screens/product_details/widgets/volume_info_count.dart';
import 'package:doza_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

class ProductVolumeCount extends StatefulWidget {
  const ProductVolumeCount({super.key, ProductDetailsApiModel? productInfo})
      : _productInfo = productInfo;

  final ProductDetailsApiModel? _productInfo;
  @override
  State<ProductVolumeCount> createState() => _ProductVolumeCountState();
}

class _ProductVolumeCountState extends State<ProductVolumeCount> {
  late List<VolumeCardItemUiModel> _cardItem;
  final _log = Logger('ProductVolumeCount');

  @override
  void initState() {
    super.initState();
    _cardItem = widget._productInfo?.volumeInfo
            .map((volumeItem) => VolumeCardItemUiModel(volumeInfo: volumeItem))
            .toList() ??
        [];
  }

  void _onItemChanged(int index, CardAction changed) {
    HapticFeedback.vibrate();
    setState(() {
      switch (changed) {
        case CardAction.increment:
          _cardItem[index].increment();
          break;
        case CardAction.decrement:
          _cardItem[index].decrement();
          break;
      }
      _log.info(_cardItem[index].volumeInfo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.customBlue6,
      child: Transform.translate(
        offset: Offset(0, -6),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              // if() добавить условие наличия подписки
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.customBlue5),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 16,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: AppColors.customBlue2,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.emoji_events,
                          color: AppColors.customBlue4,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Оформите подписку и получите ',
                            style: TextStyle(color: AppColors.customBlue4),
                          ),
                          //TODO подгружать скидку с сервера
                          Text(
                            'скидку 30%',
                            style: TextStyle(
                                color: AppColors.customBlue4,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              if (widget._productInfo != null &&
                  widget._productInfo!.volumeInfo.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Выберите объем и количество'.toUpperCase(),
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 12, color: AppColors.customBlue),
                    ),
                  ),
                ),
              if (widget._productInfo != null &&
                  widget._productInfo!.volumeInfo.isNotEmpty)
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ListView(
                    children: widget._productInfo!.volumeInfo
                        .asMap()
                        .entries
                        .map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      final cardItemState = _cardItem[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: VolumeInfoCount(
                            cardItemState: cardItemState,
                            volumeInfo: item,
                            onChange: (action) =>
                                _onItemChanged(index, action)),
                      );
                    }).toList(),
                  ),
                ))
              else
                const Expanded(child: SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
