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
