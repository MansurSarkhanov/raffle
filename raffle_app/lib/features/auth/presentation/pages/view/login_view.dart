import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/constants/path/icon_path.dart';
import 'package:raffle_app/core/utilities/extension/icon_path_ext.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:raffle_app/features/auth/presentation/widgets/open_flushbar.dart';

import '../../../../profile/presentation/widgets/support_controller.dart';
import '../../notifier/auth_state.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/whatsapp_widget.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback loginOnPressed;

  const LoginScreen({super.key, required this.loginOnPressed});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
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
                onPressed: () async {
                  if (emailLoginController.text.trim().isNotEmpty && passwordLoginController.text.trim().isNotEmpty) {
                    final result = await notifier.loginUser(
                        email: emailLoginController.text.trim(), password: passwordLoginController.text.trim());

                    // if (result == true && context.mounted) {
                    //   context.goNamed(AppRoutes.home.name);
                    // }
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
        const SizedBox(
          height: 24,
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
        const SizedBox(
          height: 24,
        ),
        InkWell(
            onTap: () {
              SupportController.openWhatsapp(context: context, text: 'Salam', number: '+994776359777');
            },
            child: WhatsAppWidget(size: size)),
      ],
    );
  }
}
