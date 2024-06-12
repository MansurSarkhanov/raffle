import 'package:flutter/material.dart';

class CamPaingAndWinnerWidget extends StatelessWidget {
  final String campaignNumber;
  final String winner;
  final String prize;

  const CamPaingAndWinnerWidget({super.key, required this.campaignNumber, required this.prize, required this.winner});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.02,
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFFD9D9D9),
              child: Text(
                campaignNumber,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
              ),
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Campaing: Samsung Galaxy S23 Plus with\nRaffle Credit',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Winner: Tofiq Mammadov (TM-12345)',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
      ],
    );
  }
}
