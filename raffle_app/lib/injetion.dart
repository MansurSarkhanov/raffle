import 'package:get_it/get_it.dart';
import 'package:raffle_app/app_router.dart';
import 'package:raffle_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:raffle_app/features/auth/domain/repository/auth_repository.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_notifier.dart';

import 'data/local/shared_preferences_service.dart';
import 'features/auth/data/service/firebase_auth_service.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory(() => SharedPreferenceServiceImpl());

  getIt.registerLazySingleton(() => FirebaseAuthServiceImpl());

  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(
    sharedPreference: getIt(),
    firebaseAuth: getIt(),
  ));

  getIt.registerSingleton(AuthNotifier(getIt()));
  getIt.registerSingleton(AppRouter(authNotifier: getIt()));
}
