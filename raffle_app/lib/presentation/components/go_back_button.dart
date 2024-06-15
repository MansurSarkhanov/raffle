import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoBackButton extends StatelessWidget {
  final Color buttonBackColor;
  final VoidCallback onPressed;
  const GoBackButton({
    super.key,
    required this.buttonBackColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: buttonBackColor),
        child: Container(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 25.w, vertical: 12.h),
          child: Image(
            fit: BoxFit.contain,
            height: 9.48.h,
            width: 18.w,
            image: const AssetImage('assets/icons/ic_back.png'),
          ),
        ),
      ),
    );
  }
}
