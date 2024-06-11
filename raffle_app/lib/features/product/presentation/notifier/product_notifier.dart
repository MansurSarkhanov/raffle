import 'package:flutter/material.dart';

import '../../domain/repository/product_repository.dart';
import 'product_state.dart';

class ProductNotifier extends ChangeNotifier {
  ProductNotifier(this.productRepository);
  final ProductRepository productRepository;

  ProductState state = ProductInitial();

  Future<void> getProductList() async {
    try {
      state = ProductProgress();
      notifyListeners();
      final result = await productRepository.getProducts();
      if (result.isSuccess()) {
        final productList = result.tryGetSuccess();
        state = ProductSuccess(productModel: productList);
        notifyListeners();
      } else if (result.isError()) {
        state = ProductError();
        notifyListeners();
      }
    } catch (e) {
      state = ProductError();
      notifyListeners();
    }
  }
}
