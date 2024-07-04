import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:raffle_app/features/auth/presentation/widgets/apple_login_button.dart';
import 'package:raffle_app/features/auth/presentation/widgets/google_login_button.dart';
import 'package:raffle_app/features/auth/presentation/widgets/open_flushbar.dart';

import '../../notifier/auth_state.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPleasedWithConditions = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextField(
                  controller: nameController,
                  textFieldImage: null,
                  hintText: 'Name',
                  height: size.height * 0.08,
                  width: size.width * 0.43),
              CustomTextField(
                  controller: surNameController,
                  textFieldImage: null,
                  hintText: 'Surname',
                  height: size.height * 0.08,
                  width: size.width * 0.43),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
              keyboardType: TextInputType.number,
              controller: numberController,
              textFieldImage: null,
              height: size.height * 0.08,
              width: size.width,
              hintText: 'Mobile number'),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            controller: emailController,
            textFieldImage: null,
            height: size.height * 0.08,
            width: size.width,
            hintText: 'Email address',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            isObscure: true,
            controller: passwordController,
            textFieldImage: null,
            height: size.height * 0.08,
            width: size.width,
            hintText: 'Password',
          ),
          Row(
            children: [
              Checkbox(
                side: const BorderSide(color: Color(0xFFD9D9D9), width: 2),

                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                value: isPleasedWithConditions,
                //activeColor: Colors.white,
                checkColor: Colors.black,
                fillColor: WidgetStateProperty.all(Colors.white),

                onChanged: (value) {
                  setState(() {
                    isPleasedWithConditions = value!;
                  });
                },
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Agree with rules',
                  style: context.typography.subheadlineBold.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Consumer<AuthNotifier>(
            builder: (context, notifier, child) {
              return CustomElevatedButton(
                  isLoading: notifier.state is AuthProgress ? true : false,
                  icon: null,
                  onPressed: () {
                    if (nameController.text.trim().isNotEmpty &&
                        surNameController.text.trim().isNotEmpty &&
                        numberController.text.trim().isNotEmpty &&
                        emailController.text.trim().isNotEmpty &&
                        passwordController.text.trim().isNotEmpty) {
                      notifier.registerUser(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          name: nameController.text.trim(),
                          number: numberController.text.trim(),
                          surname: surNameController.text.trim());
                    } else {
                      openFlushbar(context, title: "Boşluları doldurun", color: Colors.redAccent);
                    }
                  },
                  buttonText: 'Register',
                  width: size.width,
                  height: 60,
                  buttonColor: Colors.white,
                  textColor: Colors.white,
                  isBorderEnabled: true,
                  borderRadius: 45);
            },
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
