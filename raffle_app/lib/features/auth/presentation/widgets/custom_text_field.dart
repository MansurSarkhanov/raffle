import 'package:flutter/material.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';

class CustomTextField extends StatelessWidget {
  final double height;
  final double width;
  final String hintText;
  final String? textFieldImage;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool isObscure;
  const CustomTextField({
    super.key,
    required this.height,
    required this.width,
    required this.hintText,
    required this.textFieldImage,
    required this.controller,
    this.isObscure = false, this.keyboardType=TextInputType.emailAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: TextField(
        keyboardType:keyboardType,
        style: context.typography.footnoteBold.copyWith(fontWeight: FontWeight.w500, fontSize: 15),
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: context.typography.footnoteBold.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
          contentPadding: const EdgeInsets.only(
            left: 17,
          ),
        ),
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
