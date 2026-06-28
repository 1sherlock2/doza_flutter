import 'package:doza_flutter/data/services/models/product_details/product_details_api_model.dart';
import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/product_details/view_models/card_items_view_model.dart';
import 'package:doza_flutter/ui/screens/product_details/widgets/volume_info_count.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class ProductVolumeCount extends StatefulWidget {
  final ProductDetailsApiModel? _productInfo;

  const ProductVolumeCount(
      {super.key,
      ProductDetailsApiModel? productInfo,
      required CardItemsViewModel cardItemViewModel})
      : _productInfo = productInfo,
        _cardItemsViewModel = cardItemViewModel;

  final CardItemsViewModel _cardItemsViewModel;

  @override
  State<ProductVolumeCount> createState() => _ProductVolumeCountState();
}

class _ProductVolumeCountState extends State<ProductVolumeCount> {
  final _log = Logger('ProductVolumeCount');

  bool isActiveBanner = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.customBlue6,
      child: Transform.translate(
        offset: Offset(0, -6),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              if (isActiveBanner == true)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.customBlue5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.emoji_events,
                          color: AppColors.customBlue4,
                          size: 32,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: RichText(
                            softWrap: true,
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToLastDescent: true,
                                leadingDistribution:
                                    TextLeadingDistribution.even),
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              style: TextStyle(
                                  color: AppColors.customBlue4, fontSize: 14),
                              children: [
                                TextSpan(text: 'Оформите подписку и получите '),
                                TextSpan(
                                  text: 'скидку 30%',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: SizedBox(
                            width: 32,
                            height: 32,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                  AppColors.customBlue2,
                                ),
                              ),
                              onPressed: () => setState(() {
                                isActiveBanner = false;
                              }),
                              icon: Icon(
                                Icons.close_outlined,
                                color: AppColors.customBlue4,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (widget._productInfo != null &&
                  widget._productInfo!.volumeInfo.isNotEmpty)
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 16, right: 8, bottom: 8),
                  child: Scrollbar(
                      thumbVisibility: true,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ListView(
                          children: widget._productInfo!.volumeInfo
                              .asMap()
                              .entries
                              .map((entry) {
                            final index = entry.key;
                            final item = entry.value;
                            final cardItem =
                                widget._cardItemsViewModel.cardItems[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: VolumeInfoCount(
                                  cardItem: cardItem,
                                  volumeInfo: item,
                                  onChange: (action) => widget
                                      ._cardItemsViewModel
                                      .onItemChanged(index, action)),
                            );
                          }).toList(),
                        ),
                      )),
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
