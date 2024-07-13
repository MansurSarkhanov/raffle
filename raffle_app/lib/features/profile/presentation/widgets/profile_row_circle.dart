import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileRowCircle extends StatelessWidget {
  final String imageUrl;
  const ProfileRowCircle({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(shape: OvalBorder(), color: Colors.white),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(10.dm),
        child: SvgPicture.asset('assets/svg/$imageUrl.svg'),
      ),
      
    );
  }
}
