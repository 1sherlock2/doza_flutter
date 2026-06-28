class CardItemRequest {
  final int variantId;
  final int quantity;
  final int price;

  CardItemRequest(
      {required this.variantId, required this.quantity, required this.price});

  Map<String, dynamic> toJson() =>
      {'variantid': variantId, 'quantity': quantity, 'price': price};
}
