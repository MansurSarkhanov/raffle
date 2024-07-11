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
  bool isSelected = false;

  selectRestorant(int restorantIndex) {
    index = restorantIndex;
    isSelected = true;
    notifyListeners();
  }

  void backPageListener() {
    isSelected = false;
    notifyListeners();
  }

  void saveEmitter({required RestaurantsState emitState, required BuildContext context}) {
    if (context.mounted) {
      state = emitState;
      notifyListeners();
    }
  }

  Future<void> fetchAllRestorants(BuildContext context) async {
    try {
      saveEmitter(context: context, emitState: RestourantsProgress());
      await Future.delayed(const Duration(milliseconds: 500));

      final result = await restaurantRepository.getRestaurants();
      if (result.isSuccess()) {
        saveEmitter(emitState: RestourantsSuccess(restaurants: result.tryGetSuccess()!), context: context);
        restorantModel = result.tryGetSuccess();
      }
      if (result.isError()) {
        saveEmitter(emitState: RestourantsError(result.tryGetError().toString()), context: context);
      }
    } catch (e) {
      saveEmitter(emitState: RestourantsError("Error"), context: context);
    }
  }
}
