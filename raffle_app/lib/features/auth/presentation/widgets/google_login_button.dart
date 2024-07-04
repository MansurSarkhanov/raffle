import 'package:flutter/material.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/core/utilities/extension/icon_path_ext.dart';

import '../../../../core/constants/path/icon_path.dart';

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 8, color: Colors.grey.shade300),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage(IconPath.google.toPathPng))),
        ),
        const SizedBox(
          width: 5,
        ),
        Text('Continue with Google', style: context.typography.body1Bold)
      ]),
    );
  }
}
