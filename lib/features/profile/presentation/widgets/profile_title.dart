import 'package:flutter/material.dart';

class ProfileLittleContainer extends StatelessWidget {
  final String title;
  final String imageUrl;
  const ProfileLittleContainer({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 72,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 27, width: 27, child: Image(image: AssetImage(imageUrl))),
          const SizedBox(
            height: 2,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Helvetica Neue',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
