import 'package:multiple_result/multiple_result.dart';
import 'package:raffle_app/features/product/data/model/product_model.dart';
import 'package:raffle_app/features/product/data/service/product_service.dart';

import '../../domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.productService});
  final ProductServiceImpl productService;
  @override
  Future<Result<List<ProductModel>?, Exception>> getProducts() async {
    try {
      final productList = await productService.getProducts();
      if (productList is List) {
        return Result.success(productList);
      }
    } on Exception catch (e) {
      return Error(Exception(e));
    }
    return Error(Exception('Something went wrong'));
  }
}
