import 'package:flutter/material.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';

class AppleLoginButton extends StatelessWidget {
  const AppleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.apple,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Continue with Apple',
            style: context.typography.body1Bold.copyWith(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
