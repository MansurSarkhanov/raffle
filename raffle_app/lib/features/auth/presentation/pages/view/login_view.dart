import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/constants/path/icon_path.dart';
import 'package:raffle_app/core/utilities/extension/icon_path_ext.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:raffle_app/features/auth/presentation/widgets/open_flushbar.dart';

import '../../notifier/auth_state.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback loginOnPressed;
  const LoginScreen({super.key, required this.loginOnPressed});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  // late AuthNotifier _authNotifier;
  // @override
  // void initState() {
  //   super.initState();

  //   _authNotifier = context.read<AuthNotifier>();
  //   _authNotifier.addListener(
  //     () {
  //       final authNotifier = _authNotifier.state;
  //       if (authNotifier is AuthSuccess && mounted) {
  //         context.replaceNamed(AppRoutes.home.name);
  //       } else if (authNotifier is AuthError) {
  //         openFlushbar(context, message: "Yeniden cəhd edin", title: "İstifadəçi tapılmadı", color: Colors.redAccent);
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        padding: EdgeInsets.only(bottom: size.height * 0.1),
        child: Column(
          children: [
            CustomTextField(
                controller: emailLoginController,
                textFieldImage: IconPath.person.toPathPng,
                height: size.height * 0.08,
                width: size.width,
                hintText: 'Email ünvan'),
            CustomTextField(
                isObscure: true,
                controller: passwordLoginController,
                textFieldImage: IconPath.lock.toPathPng,
                height: size.height * 0.08,
                width: size.width,
                hintText: 'Parol'),
            Consumer<AuthNotifier>(
              builder: (context, notifier, child) {
                return CustomElevatedButton(
                    isLoading: notifier.state is AuthProgress ? true : false,
                    icon: null,
                    onPressed: () {
                      if (emailLoginController.text.trim().isNotEmpty &&
                          passwordLoginController.text.trim().isNotEmpty) {
                        notifier.loginUser(
                            email: emailLoginController.text.trim(), password: passwordLoginController.text.trim());
                      } else {
                        openFlushbar(context, title: "Boşluları doldurun", color: Colors.redAccent);
                      }
                    },
                    buttonText: 'Daxil ol',
                    isBorderEnabled: true,
                    width: size.width,
                    height: 60,
                    buttonColor: Colors.white,
                    textColor: Colors.white,
                    borderRadius: 13);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 60,
              width: size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: Colors.black),
              child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.apple,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Apple ilə davam edin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Avant Garde',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 60,
              width: size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: Colors.white),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(IconPath.google.toPathPng))),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Google ilə davam edin',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Avant Garde',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ]),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Column(
              children: [
                Text(
                  'Parolu Unutmusunuz?',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                Text(
                  'və ya',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.09,
            ),
            Row(
              children: [
                const Text(
                  'Profiliniz yoxdur? İndi',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
                InkWell(
                  onTap: widget.loginOnPressed,
                  child: const Text(
                    ' Qeydiyyatdan keçin',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF873838)),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
