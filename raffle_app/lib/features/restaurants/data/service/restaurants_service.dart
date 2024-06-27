import 'package:raffle_app/core/utilities/firebase/firestore_database_referance.dart';
import 'package:raffle_app/features/restaurants/data/model/restorant_model.dart';

abstract class RestaurantsService {
  Future<List<RestaurantModel>?> getRestaurants();
}

class RestaurantsServiceImpl implements RestaurantsService {
  final _firebaseReference = FirebaseReference.restaurants.ref;

  @override
  Future<List<RestaurantModel>?> getRestaurants() async {
    try {
      final response = await _firebaseReference.withConverter(
        fromFirestore: (snapshot, options) {
          return RestaurantModel.fromJson(snapshot.data()!);
        },
        toFirestore: (value, options) {
          return value.toJson();
        },
      ).get();
      if (response.docs.isNotEmpty) {

        final restaurantsList = response.docs.map((e) => e.data()).toList();

        return restaurantsList;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
