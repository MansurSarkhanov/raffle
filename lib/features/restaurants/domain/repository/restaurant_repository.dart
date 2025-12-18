import 'package:multiple_result/multiple_result.dart';

import '../../data/model/restorant_model.dart';

abstract class RestaurantRepository {
  Future<Result<List<RestaurantModel>?, Exception>> getRestaurants();
}
