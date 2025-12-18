import 'package:multiple_result/multiple_result.dart';

import '../../data/model/product_model.dart';

abstract class ProductRepository {
  Future<Result<List<ProductModel>?, Exception>> getProducts();
}
