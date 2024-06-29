import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapFabButton extends StatelessWidget {
  const MapFabButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(22)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11.0,horizontal: 26),
          child: SvgPicture.asset('assets/svg/ic_restorant_map.svg'),
        ),
      ),
    );
  }
}
