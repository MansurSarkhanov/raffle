import 'package:flutter/material.dart';
import 'package:raffle_app/core/constants/path/icon_path.dart';
import 'package:raffle_app/core/utilities/extension/icon_path_ext.dart';

class WhatsAppWidget extends StatelessWidget {
  const WhatsAppWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: size.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: const Color(0xFF20311B)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage(IconPath.whatsapp.toPathPng))),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have questions?',
                      style: TextStyle(
                          fontSize: 13, fontFamily: 'Helvetica Neue', fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                    Text(
                      'Chat with us',
                      style: TextStyle(
                          fontSize: 13, fontFamily: 'Helvetica Neue', fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const WhatsappButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class WhatsappButtonWidget extends StatelessWidget {
  const WhatsappButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 25,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(47), color: const Color(0xFF00CE1D)),
      alignment: Alignment.center,
      child: const Text(
        'Start Chat',
        style: TextStyle(
          color: Colors.black,
          fontSize: 11,
          fontFamily: 'Helvetica Neue',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
