import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:raffle_app/features/campaing/presentation/notifier/campaing_notifier.dart';
import 'package:raffle_app/features/product/domain/repository/product_repository.dart';
import 'package:raffle_app/features/product/presentation/notifier/product_notifier.dart';
import 'package:raffle_app/features/profile/domain/repository/user_info_repository.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:raffle_app/features/profile/presentation/page/profile_page.dart';
import 'package:raffle_app/presentation/pages/home/home_page.dart';

import 'core/constants/routes.dart';
import 'features/auth/presentation/pages/auth_page.dart';
import 'features/campaing/domain/repository/campaing_repository.dart';
import 'presentation/pages/splash/splash_page.dart';

final class AppRouter {
  GoRouter get instance => _appRouter;
  late final GoRouter _appRouter;

  AppRouter({required AuthNotifier authNotifier}) {
    _appRouter = GoRouter(
      initialLocation: AppRoutes.splash.path,
      routes: [
        GoRoute(
          path: AppRoutes.splash.path,
          name: AppRoutes.splash.name,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: AppRoutes.auth.path,
          name: AppRoutes.auth.name,
          builder: (context, state) => const AuthPage(),
        ),
        GoRoute(
          path: AppRoutes.home.path,
          name: AppRoutes.home.name,
          builder: (context, state) => MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => CampaingListNotifier(GetIt.instance.get<CampaingRepository>())..getCampaingList(),
              ),
              ChangeNotifierProvider(
                create: (context) => ProductNotifier(GetIt.instance.get<ProductRepository>())..getProductList(),
              )
            ],
            child: const HomePage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.profile.path,
          name: AppRoutes.profile.name,
          builder: (context, state) => ChangeNotifierProvider(
              create: (context) => ProfileNotifier(GetIt.instance.get<UserInfoRepository>()..getUserInfo()),
              child: const ProfilePage()),
        ),
      ],
    );
  }
}
