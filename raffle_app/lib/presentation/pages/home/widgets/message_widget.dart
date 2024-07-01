import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final String messageBody;
  final String sendingDate;
  const MessageWidget({super.key, required this.messageBody, required this.sendingDate});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        Row(
          children: [
            Container(
              width: 33,
              height: 33,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/im_raffle_logo.png',
                    ),
                  )),
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
            const Text(
              'RAFFLE',
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: 'Helvetica Neue',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03, vertical: size.height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  messageBody,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Text(
                  sendingDate,
                  style: const TextStyle(color: Color(0xFFA2A2A2), fontSize: 10, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 34)
      ],
    );
  }
}
