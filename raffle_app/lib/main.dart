import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/app_router.dart';
import 'package:raffle_app/features/auth/domain/repository/auth_repository.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:raffle_app/notifier/app_index_notifier.dart';

import 'core/theme/theme_scope.dart';
import 'core/theme/theme_scope_widget.dart';
import 'firebase_options.dart';
import 'injetion.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.remove("logged");
  // await prefs.remove("token");

  await init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthNotifier(getIt.get<AuthRepository>()),
        ),
        ChangeNotifierProvider(
          create: (context) => AppIndexNotifier(),
        ),
      ],
      child: const ThemeScopeWidget(child: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = ThemeScope.of(context);
    final extensions = <ThemeExtension<dynamic>>[theme.appColors, theme.appTypography];
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: GetIt.instance<AppRouter>().instance,
          debugShowCheckedModeBanner: false,
          title: 'Raffle',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
              extensions: extensions
          ),
        );
      },
    );
  }
}
