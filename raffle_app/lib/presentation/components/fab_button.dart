import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FabButton extends StatelessWidget {
  const FabButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFFFE21AC), Color(0xFFFA1D33)]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SvgPicture.asset('assets/svg/qr.svg'),
      ),
    );
  }
}
