import 'package:flutter/material.dart';

import '../../../../presentation/components/go_back_button.dart';

class SavedDebitCartScreen extends StatelessWidget {
  const SavedDebitCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: Padding(
        padding: EdgeInsets.only(top: size.height * 0.08, right: size.width * 0.04, left: size.width * 0.04),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GoBackButton(
                    buttonBackColor: const Color(0xFFD9D9D9),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const Text(
                  'Payment Options',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.3,
            ),
            const Text(
              'Once you make a purchase, your card(s)\nwill appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFA2A2A2),
                fontSize: 18,
                fontFamily: 'Helvetica Neue',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
