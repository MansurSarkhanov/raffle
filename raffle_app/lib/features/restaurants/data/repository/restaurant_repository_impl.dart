import 'package:multiple_result/multiple_result.dart';
import 'package:raffle_app/features/restaurants/data/model/restorant_model.dart';

import '../../domain/repository/restaurant_repository.dart';
import '../service/restaurants_service.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantsService restaurantsService;
  RestaurantRepositoryImpl({required this.restaurantsService});

  @override
  Future<Result<List<RestaurantModel>?, Exception>> getRestaurants() async {
    try {
      final result = await restaurantsService.getRestaurants();
      if (result is List) {
        return Success(result);
      }
    } on Exception catch (e) {
      return Error(Exception(e.toString()));
    }
    return Error(Exception());
  }
}
