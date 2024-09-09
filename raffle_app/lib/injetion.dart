import 'package:get_it/get_it.dart';
import 'package:raffle_app/app_router.dart';
import 'package:raffle_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:raffle_app/features/auth/domain/repository/auth_repository.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:raffle_app/features/campaing/data/repository/campaing_repository_impl.dart';
import 'package:raffle_app/features/campaing/data/service/campaing_service.dart';
import 'package:raffle_app/features/campaing/domain/repository/campaing_repository.dart';
import 'package:raffle_app/features/campaing/presentation/notifier/campaing_notifier.dart';
import 'package:raffle_app/features/product/data/service/product_service.dart';
import 'package:raffle_app/features/product/domain/repository/product_repository.dart';
import 'package:raffle_app/features/profile/data/service/user_info_service.dart';
import 'package:raffle_app/features/profile/domain/repository/user_info_repository.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:raffle_app/features/restaurants/domain/repository/restaurant_repository.dart';
import 'package:raffle_app/features/restaurants/presentation/notifier/restourants_notifier.dart';

import 'data/local/shared_preferences_service.dart';
import 'features/auth/data/service/firebase_auth_service.dart';
import 'features/product/data/repository/product_repository_impl.dart';
import 'features/product/presentation/notifier/product_notifier.dart';
import 'features/profile/data/repository/user_info_repository_impl.dart';
import 'features/restaurants/data/repository/restaurant_repository_impl.dart';
import 'features/restaurants/data/service/restaurants_service.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory(() => SharedPreferenceServiceImpl());
  getIt.registerLazySingleton(() => FirebaseAuthServiceImpl());
  getIt.registerLazySingleton(() => CampaingServiceImpl());
  getIt.registerLazySingleton(() => ProductServiceImpl());
  getIt.registerLazySingleton(() => UserInfoServiceImpl());
  getIt.registerLazySingleton(() => RestaurantsServiceImpl());

  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(
    sharedPreference: getIt(),
    firebaseAuth: getIt(),
  ));
  getIt.registerSingleton<CampaingRepository>(CampaingRepositoryImpl(
    campaingService: getIt(),
  ));
  getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(
    productService: getIt(),
  ));
  getIt.registerSingleton<UserInfoRepository>(UserInfoRepositoryImpl(
    sharedService: getIt(),
    userInforRepository: getIt(),
  ));
  getIt.registerSingleton<RestaurantRepository>(RestaurantRepositoryImpl(
    restaurantsService: getIt(),
  ));

  getIt.registerSingleton(AuthNotifier(getIt()));
  getIt.registerSingleton(CampaingListNotifier(getIt())..getCampaingList());
  getIt.registerSingleton(ProductNotifier(getIt()..getProducts()));
  getIt.registerSingleton(ProfileNotifier(getIt())..getUserInformation());
  getIt.registerSingleton(RestourantsNotifier());

  getIt.registerSingleton(AppRouter(authNotifier: getIt()));
}
