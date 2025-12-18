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
            child: const ProfileRowCircle(imageUrl: 'ic_facebook')),
        InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: const ProfileRowCircle(imageUrl: 'ic_istagram')),
        InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: const ProfileRowCircle(imageUrl: 'ic_tiktok')),
        InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: const ProfileRowCircle(imageUrl: 'ic_youtube')),
        InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {},
            child: const ProfileRowCircle(imageUrl: 'ic_linkedin')),
      ],
    );
  }
}
