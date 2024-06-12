import 'package:flutter/material.dart';

class WinnerCard extends StatelessWidget {
  final String nameOfWinner;
  final String prizeName;
  final String ticketId;
  final String drawDate;

  const WinnerCard(
      {super.key, required this.drawDate, required this.nameOfWinner, required this.prizeName, required this.ticketId});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 170,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFEA5A5A),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Draw Result',
                  style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Winner: ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      nameOfWinner,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Prize: ',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      prizeName,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Winning Ticket: ',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      ticketId,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Draw Date: ',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Text(
                      drawDate,
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ],
                ),
                const Text(
                  'Please see the draw video on your social channels.',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),
          ),
          const Positioned(
            left: -38,
            child: CircleAvatar(
              backgroundColor: Color(0xFFF1F1F1),
              radius: 25,
            ),
          ),
          const Positioned(
            right: -38,
            child: CircleAvatar(
              backgroundColor: Color(0xFFF1F1F1),
              radius: 25,
            ),
          )
        ],
      ),
    );
  }
}
