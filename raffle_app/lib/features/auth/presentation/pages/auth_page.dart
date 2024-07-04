import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';

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
  // late AuthNotifier _authNotifier;

  // @override
  // void initState() {
  //   super.initState();

  //   _authNotifier = context.read<AuthNotifier>();
  //   _authNotifier.addListener(
  //     () {
  //       final authNotifier = _authNotifier.state;
  //       if (authNotifier is AuthSuccess) {
  //         context.goNamed(AppRoutes.home.name);
  //       } else if (authNotifier is AuthError) {
  //         openFlushbar(context,
  //             message: "Yeniden cəhd edin",
  //             title: curIndex == 0 ? "İstifadəçi tapılmadı" : "Email və ya parol yanlıs",
  //             color: Colors.redAccent);
  //       }
  //     },
  //   );
  // }

  int curIndex = 0;
  bool isLoginSelected = true;

  @override
  Widget build(BuildContext context) {
    PageController pgController = PageController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F0F0),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.15402843601,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 53.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDFDFDF),
                        borderRadius: BorderRadius.circular(42),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Login', style: context.typography.calloutBold),
                          Text('Register', style: context.typography.calloutBold),
                        ],
                      ),
                    ),
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      alignment: isLoginSelected ? Alignment.centerLeft : Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          isLoginSelected = !isLoginSelected;
                          if (isLoginSelected) {
                            pgController.animateToPage(0,
                                duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                          } else {
                            pgController.animateToPage(1,
                                duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                          }
                          setState(() {});
                        },
                        child: Container(
                          width: 176.w,
                          height: 62,
                          decoration: BoxDecoration(
          
                            gradient:
                                const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                              Color(0xFFFFE700),
                              Color(0xFFEABE00),
                            ]),
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
                          child: Text(isLoginSelected ? 'Login' : 'Register',
                              style: context.typography.headlineBold.copyWith(fontWeight: FontWeight.w800)),
                        ),
                      ),
                    ),
                  ],
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
                      LoginScreen(
                       
                      ),
                      RegisterScreen(
                        
                      ),
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
    );
  }
}
