import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/constants/path/icon_path.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/core/utilities/extension/icon_path_ext.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:raffle_app/features/auth/presentation/widgets/apple_login_button.dart';
import 'package:raffle_app/features/auth/presentation/widgets/google_login_button.dart';
import 'package:raffle_app/features/auth/presentation/widgets/open_flushbar.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  late AuthNotifier authNotifier;
  @override
  void initState() {
    super.initState();
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(
              controller: emailLoginController,
              textFieldImage: IconPath.person.toPathPng,
              height: size.height * 0.08,
              width: size.width,
              hintText: 'Email Address'),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              isObscure: true,
              controller: passwordLoginController,
              textFieldImage: IconPath.lock.toPathPng,
              height: size.height * 0.08,
              width: size.width,
              hintText: 'Password'),
          const SizedBox(
            height: 20,
          ),
          Consumer<AuthNotifier>(
            builder: (context, notifier, child) {
              return CustomElevatedButton(
                  isLoading: false,
                  icon: null,
                  onPressed: () async {
                    if (emailLoginController.text.trim().isNotEmpty && passwordLoginController.text.trim().isNotEmpty) {
                      final result = await notifier.loginUser(
                          email: emailLoginController.text.trim(), password: passwordLoginController.text.trim());
                      if (result && context.mounted) {
                        context.goNamed('home');
                      } else {
                        openFlushbar(context, title: "Istifadeci tapilmadi", color: Colors.redAccent);
                      }
                    } else {
                      openFlushbar(context, title: "Boşluları doldurun", color: Colors.redAccent);
                    }
                  },
                  buttonText: 'Login',
                  isBorderEnabled: true,
                  width: size.width,
                  height: 60,
                  buttonColor: Colors.white,
                  textColor: Colors.white,
                  borderRadius: 45);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Text(
              'Forgot Password?',
              style: context.typography.footnoteBold.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const AppleLoginButton(),
          const SizedBox(
            height: 20,
          ),
          const GoogleLoginButton()
        ],
      ),
    );
  }
}
