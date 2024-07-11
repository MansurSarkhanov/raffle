import 'package:flutter/material.dart';

import 'profile_row_circle.dart';

class ContactMethod extends StatelessWidget {
  const ContactMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: const ProfileRowCircle(imageUrl: 'assets/images/im_instagram.png')),
        InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: const ProfileRowCircle(imageUrl: 'assets/images/im_facebook.png')),
        InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: const ProfileRowCircle(imageUrl: 'assets/images/im_linkedin.png')),
        InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: const ProfileRowCircle(imageUrl: 'assets/images/im_twitter.png')),
        InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: const ProfileRowCircle(imageUrl: 'assets/images/im_tiktok.png')),
      ],
    );
  }
}
