import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final double height;
  final double width;
  final String hintText;
  final String? textFieldImage;
  final TextEditingController controller;
  final bool isObscure;
  const CustomTextField({
    super.key,
    required this.height,
    required this.width,
    required this.hintText,
    required this.textFieldImage,
    required this.controller,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13)),
          child: TextField(
            obscureText: isObscure,
            controller: controller,
            decoration: InputDecoration(
                icon: textFieldImage != null
                    ? Padding(
                        padding: EdgeInsets.only(left: size.height * 0.01),
                        child: Container(
                          height: size.height * 0.05,
                          width: size.width * 0.05,
                          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(textFieldImage!))),
                        ),
                      )
                    : null,
                border: InputBorder.none,
                hintText: hintText,
                contentPadding: EdgeInsets.only(left: size.width * 0.03)),
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
      ],
    );
  }
}
