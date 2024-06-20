import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raffle_app/presentation/pages/home/scan_page.dart';

class FabButton extends StatelessWidget {
  const FabButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const ScanPage();
          },
        ));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFE21AC), Color(0xFFFA1D33)]),
            ),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: SvgPicture.asset('assets/svg/qr.svg'),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          const Text(
            'Scan',
            style: TextStyle(fontSize: 9, color: Color(0xFF505050), fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
