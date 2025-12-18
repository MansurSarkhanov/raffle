import 'package:flutter/material.dart';

class CallEmailCard extends StatelessWidget {
  const CallEmailCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 45,
              width: size.width * 0.4,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
              alignment: Alignment.center,
              child: const Text(
                'Call us',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 45,
              width: size.width * 0.4,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
              alignment: Alignment.center,
              child: const Text(
                'Email us',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Helvetica Neue',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
