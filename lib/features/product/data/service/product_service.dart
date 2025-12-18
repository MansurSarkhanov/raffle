import 'package:raffle_app/features/product/data/model/product_model.dart';

import '../../../../core/utilities/firebase/firestore_database_referance.dart';

abstract class ProductService {
  Future<List<ProductModel>?> getProducts();
}

final class ProductServiceImpl implements ProductService {
  final _firebaseReference = FirebaseReference.products.ref;

  @override
  Future<List<ProductModel>?> getProducts() async {
    try {
      final response = await _firebaseReference.withConverter(
        fromFirestore: (snapshot, option) {
          return ProductModel.fromJson(snapshot.data()!);
        },
        toFirestore: (value, options) {
          return value.toJson();
        },
      ).get();
      if (response.docs.isNotEmpty) {
        final campaingList = response.docs.map((e) => e.data()).toList();
        return campaingList;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
