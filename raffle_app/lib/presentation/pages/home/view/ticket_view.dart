import 'package:flutter/material.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';
import 'package:raffle_app/presentation/pages/home/widgets/ticket_winner_card.dart';

import '../../../../features/profile/presentation/widgets/winner_card.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 390,
            child: Stack(
              fit: StackFit.loose,
              textDirection: TextDirection.ltr,
              children: [
                Positioned(
                  top: 156,
                  left: 6,
                  right: 6,
                  child: TicketWinnerCard(),
                ),
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
            ),
          ),
          SelectedTicketRow(),
          SizedBox(
            height: 31,
          ),
          TicketWinnerCard(),
          SizedBox(
            height: 12,
          ),
          SelectedTicketRow(),
          SizedBox(
            height: 31,
          ),
          WinnerCard(
              drawDate: 'October 13, 2023 11:18 AM',
              nameOfWinner: 'Farid Ahmadov',
              prizeName: 'USD27,100 Cash',
              ticketId: 'CG-03265-088063422'),
        ],
      ),
    );

 
  }
}

class SelectedTicketRow extends StatelessWidget {
  const SelectedTicketRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(41)),
          child: const Center(
            child: Row(
              children: [
                TitleHeading1Widget(
                  text: 'See all tickets',
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 18,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 21),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(41),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF637FFF), Color(0xFF4307FF)])),
          child: const Center(
            child: TitleHeading1Widget(
              text: 'Buy more',
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

