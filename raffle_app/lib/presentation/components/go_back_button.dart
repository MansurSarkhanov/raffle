import 'package:flutter/material.dart';

class GoBackButton extends StatelessWidget {
  final Color buttonBackColor;
  final double height;
  final double width;
  final VoidCallback onPressed;
  const GoBackButton({
    super.key,
    required this.buttonBackColor,
    required this.onPressed,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: buttonBackColor),
        child: Container(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
          child: const Image(
            fit: BoxFit.contain,
            image: AssetImage('assets/icons/ic_back.png'),
          ),
        ),
      ),
    );
  }
}
