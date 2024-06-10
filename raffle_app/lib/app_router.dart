import 'package:go_router/go_router.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:raffle_app/presentation/pages/home/home_page.dart';

import 'core/constants/routes.dart';
import 'features/auth/presentation/pages/auth_page.dart';
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
          builder: (context, state) => const HomePage(),
        ),
      ],
    );
  }
}
