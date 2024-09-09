import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/presentation/animation/bounce_animation.dart';

import '../notifier/auth_notifier.dart';
import '../notifier/auth_state.dart';
import 'view/login_view.dart';
import 'view/register_view.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final PageController pgController = PageController();

  int curIndex = 0;
  bool isLoginSelected = true;
  @override
  dispose() {
    pgController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F0F0),
      body: BounceFromBottomAnimation(
        delay: 2.2,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.15402843601,
                  ),
                  BounceFromBottomAnimation(
                    delay: 2.1,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 62.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFDFDFDF),
                            borderRadius: BorderRadius.circular(42),
                          ),
                          child: Stack(children: [
                            AnimatedAlign(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.decelerate,
                              alignment: isLoginSelected ? Alignment.centerLeft : Alignment.centerRight,
                              child: Container(
                                width: 176.w,
                                height: 62,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFFFE700),
                                      Color(0xFFEABE00),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(51),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                      blurRadius: 20,
                                      offset: const Offset(0, 0),
                                    ),
                                  ],
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    child: InkWell(
                                        highlightColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          Future.delayed(const Duration(microseconds: 100), () {
                                            isLoginSelected = true;
                                            setState(() {});
                                          });
                                          pgController.animateToPage(0,
                                              duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                                        },
                                        child: Center(
                                            child: Text('Login',
                                                style: isLoginSelected
                                                    ? context.typography.headlineBold
                                                        .copyWith(fontWeight: FontWeight.w800)
                                                    : context.typography.calloutBold)))),
                                Expanded(
                                  child: InkWell(
                                    highlightColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    onTap: () {
                                      Future.delayed(const Duration(microseconds: 100), () {
                                        isLoginSelected = false;
                                        setState(() {});
                                      });
                                      pgController.animateToPage(1,
                                          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                                    },
                                    child: Center(
                                      child: Text(
                                        'Register',
                                        style: isLoginSelected
                                            ? context.typography.calloutBold
                                            : context.typography.headlineBold.copyWith(fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pgController,
                      onPageChanged: (value) {},
                      children: const [
                        LoginScreen(),
                        RegisterScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (context.watch<AuthNotifier>().state is AuthProgress)
              ModalBarrier(
                color: Colors.black.withOpacity(0.5),
                dismissible: false,
              ),
            if (context.watch<AuthNotifier>().state is AuthProgress)
              Center(
                child: Lottie.asset('assets/gif/lottie_login_loading.json', height: 150, width: 150),
              ),
          ],
        ),
      ),
    );
  }
}
