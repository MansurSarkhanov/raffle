import 'package:equatable/equatable.dart';

import '../../data/model/restorant_model.dart';

abstract class RestaurantsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RestaurantsInitial extends RestaurantsState {}

class RestourantsProgress extends RestaurantsState {}

class RestourantsSuccess extends RestaurantsState {
  final List<RestaurantModel> restaurants;
  RestourantsSuccess({required this.restaurants});
}

class RestourantsError extends RestaurantsState {
  final String message;
  RestourantsError(this.message);
}
