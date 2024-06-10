import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/utilities/extension/icon_path_ext.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:raffle_app/features/auth/presentation/widgets/open_flushbar.dart';

import '../../../../../core/constants/path/icon_path.dart';
import '../../../../../core/constants/routes.dart';
import '../../notifier/auth_state.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback loginOnPressed;
  const RegisterScreen({super.key, required this.loginOnPressed});

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
  late AuthNotifier _authNotifier;

  @override
  void initState() {
    super.initState();

    _authNotifier = context.read<AuthNotifier>();
    _authNotifier.addListener(
      () {
        final authNotifier = _authNotifier.state;
        if (authNotifier is AuthSuccess) {
          context.replaceNamed(AppRoutes.home.name);
        } else if (authNotifier is AuthError) {
          openFlushbar(context, message: authNotifier.message, title: "Nəsə düz getmədi", color: Colors.redAccent);
        }
      },
    );
  }

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
                hintText: 'Ad',
                height: size.height * 0.08,
                width: size.width * 0.43),
            CustomTextField(
                controller: surNameController,
                textFieldImage: null,
                hintText: 'Soyad',
                height: size.height * 0.08,
                width: size.width * 0.43),
          ],
        ),
        CustomTextField(
            controller: numberController,
            textFieldImage: null,
            height: size.height * 0.08,
            width: size.width,
            hintText: 'Mobil nömrə'),
        CustomTextField(
          controller: emailController,
          textFieldImage: null,
          height: size.height * 0.08,
          width: size.width,
          hintText: 'Email ünvan',
        ),
        CustomTextField(
          isObscure: true,
          controller: passwordController,
          textFieldImage: null,
          height: size.height * 0.08,
          width: size.width,
          hintText: 'Parol',
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
              child: const Text(
                'Şərtlərlə razıyam',
                style: TextStyle(color: Color(0xFF435784)),
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
                buttonText: 'Qeydiyyat',
                width: size.width,
                height: 60,
                buttonColor: Colors.white,
                textColor: Colors.white,
                isBorderEnabled: true,
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
          height: size.height * 0.03,
        ),
        const Text(
          'və ya',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
        Row(
          children: [
            const Text(
              'Profiliniz var?',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            InkWell(
              onTap: widget.loginOnPressed,
              child: const Text(
                'Daxil olun',
                style: TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF873838)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.04,
        ),
      ],
    ));
  }
}
