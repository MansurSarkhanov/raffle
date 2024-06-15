import 'package:flutter/material.dart';
import 'package:raffle_app/presentation/pages/home/widgets/ticket_winner_card.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return const Stack(
      fit: StackFit.loose,
      textDirection: TextDirection.ltr,
      children: [
        Positioned(
          top: 104,
          left: 4,
          right: 4,
          child: TicketWinnerCard(),
        ),
        Positioned(
          top: 52,
          left: 2,
          right: 2,
          child: TicketWinnerCard(),
        ),
        Positioned(child: TicketWinnerCard()),
      ],
    );

    // SizedBox(
    //   height: size.height,
    //   width: size.width,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       SizedBox(
    //         height: size.height * 0.2,
    //       ),
    //       CircleAvatar(
    //         radius: 60,
    //         backgroundColor: Colors.white,
    //         child: SizedBox(height: 50, width: 50, child: Image.asset('assets/images/im_ticket.png')),
    //       ),
    //       const SizedBox(
    //         height: 10,
    //       ),
    //       const Text(
    //         'You can see your Active Tickets here after you\nhave made a purchase',
    //         textAlign: TextAlign.center,
    //         style: TextStyle(
    //           color: Color(0xFF494949),
    //           fontSize: 15,
    //           fontFamily: 'Helvetica Neue',
    //           fontWeight: FontWeight.w400,
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}

extension CardTopExt on double {
  double get forFirstStackCard => this == topOffset ? 280 : topOffset;
  double get forSecondStackCard => this == 220 ? 160 : 400;
}

double topOffset = 100;
double expandedCardTop = topOffset;
double expandedHeight = 360;
double card1Top = expandedCardTop;
double card2Top = expandedCardTop + 60;
double card3Top = expandedCardTop + expandedHeight;
bool animateHeight = false;
int selectedCard = 1;
