import 'package:flutter/material.dart';

class ProfileRowCircle extends StatelessWidget {
  final String imageUrl;
  const ProfileRowCircle({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: const ShapeDecoration(shape: OvalBorder(), color: Colors.white),
      alignment: Alignment.center,
      child: SizedBox(
        height: 25,
        width: 25,
        child: Image(image: AssetImage(imageUrl)),
      ),
    );
  }
}
