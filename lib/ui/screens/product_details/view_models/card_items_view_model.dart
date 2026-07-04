import 'package:doza_flutter/data/services/models/product_details/product_details_api_model.dart';
import 'package:doza_flutter/ui/screens/product_details/models/card_item_request.dart';
import 'package:doza_flutter/ui/screens/product_details/models/volume_card_item_ui_model.dart';
import 'package:doza_flutter/ui/view_models/cart_state_notifier.dart';
import 'package:doza_flutter/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logging/logging.dart';

class CardItemsViewModel extends ChangeNotifier {
  CardItemsViewModel({required CartStateNotifier cartStateNorifier})
      : _cartStateNorifier = cartStateNorifier;

  final CartStateNotifier _cartStateNorifier;
  List<VolumeCardItemUiModel> _cardItems = [];
  List<VolumeCardItemUiModel> get cardItems => _cardItems;

  final _log = Logger('count');
  bool isErrorAddCart = false;

  double get totalOrderPrice =>
      _cardItems.fold(0.0, (sum, item) => sum + item.totalPrice);

  int get totalOrderCount =>
      _cardItems.fold(0, (sum, item) => sum + item.count);

  void clear() {
    _cardItems.map((cardItem) {
      cardItem.count = 0;
      cardItem.totalPrice = 0;
      return cardItem;
    }).toList();
    notifyListeners();
  }

  List<CardItemRequest> get _cardItemRequest => _cardItems
      .where((item) => item.count > 0)
      .map((item) => CardItemRequest(
          variantId: item.volumeInfo.variantId,
          quantity: item.count,
          price: item.volumeInfo.price))
      .toList();

  Future<void> addToBasket() async {
    final items = _cardItemRequest;
    if (items.isEmpty) return;
    final responseAddCart =
        await _cartStateNorifier.addToCart(_cardItemRequest);
    if (!responseAddCart) {
      isErrorAddCart = true;
      notifyListeners();
      return;
    }
    clear();
  }

  void initCartItems(ProductDetailsApiModel? info) {
    if (info != null) {
      _cardItems = info.volumeInfo
          .map((v) => VolumeCardItemUiModel(volumeInfo: v))
          .toList();
    }
  }

  void onItemChanged(int index, CardAction changed) {
    HapticFeedback.vibrate();
    switch (changed) {
      case CardAction.increment:
        _cardItems[index].increment();
        break;
      case CardAction.decrement:
        _cardItems[index].decrement();
        break;
    }
    notifyListeners();
  }
}
