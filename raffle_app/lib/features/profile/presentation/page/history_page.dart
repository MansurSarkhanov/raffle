import 'package:flutter/material.dart';

import '../../../../presentation/components/go_back_button.dart';
import '../widgets/winner_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      Navigator.of(context).pop();
                    }),
                const Text(
                  'History',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            Expanded(
                child: ListView(
              children: const [
                WinnerCard(
                    drawDate: 'October 13, 2023 11:18 AM',
                    nameOfWinner: 'Farid Ahmadov',
                    prizeName: 'USD27,100 Cash',
                    ticketId: 'CG-03265-088063422'),
                WinnerCard(
                    drawDate: 'October 14, 2023 11:45 AM',
                    nameOfWinner: 'Emil Xanmammadov',
                    prizeName: 'USD10,100 Cash',
                    ticketId: 'AB-03265-088063422'),
                WinnerCard(
                    drawDate: 'October 23, 2023 9:00 AM',
                    nameOfWinner: 'Semral Sadiqov',
                    prizeName: 'USD37,100 Cash',
                    ticketId: 'TS-03265-088063422'),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
