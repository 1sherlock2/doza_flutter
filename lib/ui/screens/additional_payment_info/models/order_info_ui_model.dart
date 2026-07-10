import 'package:doza_flutter/data/services/models/cart_item/cart_item_api_model.dart';

import 'additional_order_info_ui_model.dart';

class OrderInfoUiModel extends AdditionalOrderInfoUiModel {
  final List<CartItemApiModel> orderItems;
  final String paymentMethod;

  OrderInfoUiModel(
      {required super.secondName,
      required super.firstName,
      required super.city,
      required super.street,
      required super.house,
      super.apartment,
      required this.orderItems,
      required this.paymentMethod});

  @override
  Map<String, dynamic> toJson() => {
        ...super.toJson(),
        'orderItems': orderItems
            .map(
              (e) => e.toJson(),
            )
            .toList(),
        'paymentMethod': paymentMethod
      };
}
