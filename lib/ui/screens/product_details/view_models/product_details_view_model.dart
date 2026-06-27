import 'package:doza_flutter/data/repositories/product_details/product_details_repository.dart';
import 'package:doza_flutter/data/services/models/product_details/product_details_api_model.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  ProductDetailsViewModel(
      {required ProductDetailsRepository productDetailsRepository,
      required String productId})
      : _productDetailsRepository = productDetailsRepository {
    _getProductDetailsInfo(productId);
  }

  final ProductDetailsRepository _productDetailsRepository;

  ProductDetailsApiModel? _productDetailsInfo;
  ProductDetailsApiModel? get productDetailsInfo => _productDetailsInfo;

  void _getProductDetailsInfo(String productId) async {
    final productDetailsResponse =
        await _productDetailsRepository.getProduct(productId);
    _productDetailsInfo = productDetailsResponse;
    notifyListeners();
  }
}
