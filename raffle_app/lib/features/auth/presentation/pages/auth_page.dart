import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/routes.dart';
import '../notifier/auth_notifier.dart';
import '../notifier/auth_state.dart';
import '../widgets/open_flushbar.dart';
import 'view/login_view.dart';
import 'view/register_view.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late AuthNotifier _authNotifier;

  @override
  void initState() {
    super.initState();

    _authNotifier = context.read<AuthNotifier>();
    _authNotifier.addListener(
      () {
        final authNotifier = _authNotifier.state;
        if (authNotifier is AuthSuccess) {
          context.goNamed(AppRoutes.home.name);
        } else if (authNotifier is AuthError) {
          openFlushbar(context,
              message: "Yeniden cəhd edin",
              title: curIndex == 0
                  ? "İstifadəçi tapılmadı"
                  : "Email və ya parol yanlıs",
              color: Colors.redAccent);
        }
      },
    );
  }

  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageController pgController = PageController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F0F0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFFE1E1E1)),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            curIndex = 0;
                            pgController.animateToPage(curIndex,
                                duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
                          });
                        },
                        child: Container(
                          height: 70,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: curIndex == 0 ? Colors.white : const Color(0xFFE1E1E1),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                            child: Text(
                              "Daxil ol",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            curIndex = 1;
                            pgController.animateToPage(curIndex,
                                duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
                          });
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 70,
                            decoration: BoxDecoration(
                                color: (curIndex == 1 ? Colors.white : const Color(0xFFE1E1E1)),
                                borderRadius: BorderRadius.circular(20)),
                            child:
                                const Text("Qeydiyyat", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              SizedBox(
                height: curIndex == 0 ? 720 : 820,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pgController,
                  onPageChanged: (value) {},
                  children: [
                    LoginScreen(
                      loginOnPressed: () {
                        if (pgController.hasClients) {
                          setState(() {
                            curIndex = 0;
                            pgController.animateToPage(curIndex,
                                duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
                          });
                        }
                      },
                    ),
                    RegisterScreen(
                      loginOnPressed: () {
                        if (pgController.hasClients) {
                          // setState(() {
                          //   curIndex = 1;
                          //   pgController.animateToPage(curIndex,
                          //       duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);
                          // });
                        }
                      },
                    ),
                  ],
                ),
              ),
            
            
            ],
          ),
        ),
      ),
    );
  }
}
