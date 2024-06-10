import 'package:flutter/material.dart';

import '../widgets/whatsapp_widget.dart';
import 'view/login_view.dart';
import 'view/register_view.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int curIndex = 0;
  @override
  Widget build(BuildContext context) {
    PageController pgController = PageController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F0F0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.2,
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
                          child: const Text("Qeydiyyat", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Expanded(
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
            InkWell(
                onTap: () {
                  // SupportController.openWhatsapp(context: context, text: 'Salam', number: '+994776359777');
                },
                child: WhatsAppWidget(size: size)),
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
