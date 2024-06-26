import 'package:flutter/material.dart';

import '../../data/model/restorant_model.dart';
import '../../domain/repository/restaurant_repository.dart';
import 'restourants_state.dart';

class RestourantsNotifier extends ChangeNotifier {
  RestourantsNotifier(this.restaurantRepository);

  final RestaurantRepository restaurantRepository;
  RestaurantsState state = RestaurantsInitial();
  List<RestaurantModel>? restorantModel;
  int index = 0;

  selectRestorant(int restorantIndex) {
    index = restorantIndex;
    notifyListeners();
  }

  Future<void> fetchAllRestorants() async {
    try {
      state = RestourantsProgress();
      notifyListeners();
      await Future.delayed(const Duration(milliseconds: 500));

      final result = await restaurantRepository.getRestaurants();
      if (result.isSuccess()) {
        state = RestourantsSuccess(restaurants: result.tryGetSuccess()!);
        restorantModel = result.tryGetSuccess();
        notifyListeners();
      }
      if (result.isError()) {
        state = RestourantsError(result.tryGetError().toString());
        notifyListeners();
      }
    } catch (e) {
      state = RestourantsError("Error");
      notifyListeners();
    }
  }
}
