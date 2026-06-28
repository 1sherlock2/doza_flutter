import 'package:doza_flutter/ui/core/themes/colors.dart';
import 'package:doza_flutter/ui/screens/product_details/view_models/card_items_view_model.dart';
import 'package:doza_flutter/ui/screens/product_details/view_models/product_details_view_model.dart';
import 'package:doza_flutter/ui/screens/product_details/widgets/product_volume_count.dart';
import 'package:doza_flutter/ui/screens/product_details/widgets/total_price.dart';
import 'package:doza_flutter/ui/view_models/general_favorites_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen(
      {super.key,
      required ProductDetailsViewModel productDetailsViewModel,
      required CardItemsViewModel cardItemViewModel})
      : _productDetailsViewModel = productDetailsViewModel,
        _cardItemViewModel = cardItemViewModel;

  final ProductDetailsViewModel _productDetailsViewModel;
  final CardItemsViewModel _cardItemViewModel;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final _log = Logger('ProductDetailsScreen');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: ListenableBuilder(
            listenable: widget._productDetailsViewModel,
            builder: (context, constraints) {
              final productInfo =
                  widget._productDetailsViewModel.productDetailsInfo;
              widget._cardItemViewModel.initCartItems(productInfo);

              return Skeletonizer(
                enabled: productInfo == null,
                child: Column(children: [
                  Stack(
                    children: [
                      LayoutBuilder(builder: (context, constraints) {
                        return ClipRRect(
                            child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            productInfo != null
                                ? Image.network(
                                    productInfo.imageUrl,
                                    fit: BoxFit.fill,
                                    width: constraints.maxWidth,
                                    height: 250,
                                  )
                                : Container(
                                    width: constraints.maxWidth,
                                    height: 250,
                                    color: Colors.grey[200],
                                  ),
                            Positioned(
                                top: 20,
                                left: 20,
                                child: GestureDetector(
                                  onTap: () => context.pop(),
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        color: AppColors.white2),
                                    child: Icon(
                                      size: 34,
                                      Icons.keyboard_arrow_left,
                                      color: AppColors.grey5,
                                    ),
                                  ),
                                )),
                            Positioned(
                                top: 20,
                                right: 20,
                                child: GestureDetector(
                                  onTap: () => context
                                      .read<GeneralFavoritesViewModel>()
                                      .handleTapFavorites(productInfo?.id ?? 0),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        color: AppColors.white2),
                                    child: context
                                            .watch<GeneralFavoritesViewModel>()
                                            .isFavorites(productInfo?.id ?? 0)
                                        ? Icon(Icons.favorite_rounded,
                                            color: AppColors.red1)
                                        : Icon(
                                            Icons.favorite_outline,
                                            color: AppColors.grey5,
                                          ),
                                  ),
                                )),
                          ],
                        ));
                      }),
                    ],
                  ),
                  Transform.translate(
                    offset: Offset(0, -20),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(top: 10, left: 16, right: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(25, 34),
                          topRight: Radius.elliptical(25, 34),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              Text(productInfo?.name ?? BoneMock.title,
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w400)),
                              if (productInfo?.description != null)
                                Tooltip(
                                  decoration: BoxDecoration(
                                      color: AppColors.customBlue,
                                      borderRadius: BorderRadius.circular(10)),
                                  constraints: BoxConstraints(maxWidth: 300),
                                  preferBelow: false,
                                  showDuration: Duration(seconds: 10),
                                  triggerMode: TooltipTriggerMode.tap,
                                  message: productInfo?.description,
                                  child: Icon(
                                    Icons.info_outline,
                                    color: AppColors.grey4,
                                  ),
                                )
                            ],
                          ),
                          Text(
                            productInfo?.categoryName ?? BoneMock.name,
                            style:
                                TextStyle(fontSize: 14, color: AppColors.grey5),
                          ), // ... остальная информация
                        ],
                      ),
                    ),
                  ),
                  ListenableBuilder(
                      listenable: widget._cardItemViewModel,
                      builder: (context, _) {
                        return Expanded(
                            child: ProductVolumeCount(
                          cardItemViewModel: widget._cardItemViewModel,
                          productInfo: productInfo,
                        ));
                      }),
                  TotalPrice(
                    cardItemViewModel: widget._cardItemViewModel,
                  )
                ]),
              );
            }));
  }
}
