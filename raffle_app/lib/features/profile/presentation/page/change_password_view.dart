import 'package:flutter/material.dart';

import '../../../../presentation/components/go_back_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var isObsecureText = false;
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: Padding(
        padding: EdgeInsets.only(top: size.height * 0.08, right: size.width * 0.04, left: size.width * 0.04),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GoBackButton(
                    buttonBackColor: const Color(0xFFD9D9D9),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const Text(
                  'Change Password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Column(
              children: [
                Container(
                  height: size.height * 0.08,
                  width: size.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                  child: Center(
                    child: PasswordTextField(isObsecureText: isObsecureText, size: size),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  height: size.height * 0.08,
                  width: size.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                  child: Center(
                    child: PasswordTextField(isObsecureText: isObsecureText, size: size),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print(isObsecureText);
                      },
                      child: Container(
                          height: size.height * 0.07,
                          width: size.width * 0.4,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xFF435784)),
                          alignment: Alignment.center,
                          child: const Text(
                            'Update',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Helvetica Neue',
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
