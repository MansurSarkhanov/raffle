import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../presentation/pages/home/view/profile_detail.dart';
import '../../../../raffle_co/view/wallet_tab.dart';
import '../../../auth/presentation/widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final oldpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    var isObsecureText = false;
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundColorCard(
            downColor: Color(0xFFEEEEEE),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1A026C),
                Color(0xFF7518E8),
                Color(0xFFEEEEEE),
              ],
            ),
          ),
          Column(
            children: [
              TopUpAppBar(
                text: AppLocalizations.of(context)!.change_password,
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                        isValidate: true,
                        controller: oldpasswordController,
                        textFieldImage: null,
                        hintText: 'Old Password',
                        height: size.height * 0.07,
                        width: size.width),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                        isValidate: true,
                        controller: passwordController,
                        textFieldImage: null,
                        hintText: 'New Password',
                        height: size.height * 0.07,
                        width: size.width),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextField(
                      isValidate: true,
                      controller: confirmpasswordController,
                      textFieldImage: null,
                      height: size.height * 0.07,
                      width: size.width,
                      hintText: 'Re-enter Password',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0xFF1C29D1),
                                Color(0xFF7166FE),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(34.r),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 55),
                            child: Text(
                              'Update',
                              style: context.typography.body2Regular.copyWith(color: Colors.white),
                            ),
                    ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
             
            ],
          ),
        ],
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  PasswordTextField({
    super.key,
    this.isObsecureText,
    required this.size,
  });

  bool? isObsecureText;
  final Size size;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isObsecureText!,
      textAlignVertical: TextAlignVertical.center,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            widget.isObsecureText = !widget.isObsecureText!;
            setState(() {});
          },
          child: Icon(
            widget.isObsecureText == false ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        contentPadding: EdgeInsets.only(left: widget.size.width * 0.03),
        border: InputBorder.none,
        hintText: 'New Password',
      ),
    );
  }
}
