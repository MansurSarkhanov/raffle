import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';

class SwipebleHomeCards extends StatelessWidget {
  const SwipebleHomeCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 318.h,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: const Color(0xFF000000).withOpacity(.25),
              offset: const Offset(0, 4),
            )
          ],
          color: const Color(0xFFEF920F),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 36),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'BIG \nDREAM\nBIG \nPRIZE!',
              style: context.typography.largeTitle2Bold
                  .copyWith(color: Colors.white, fontSize: 44, fontWeight: FontWeight.w900, height: 0.9),
            ),
          ),
        ),
      ),
    );
  }
}
