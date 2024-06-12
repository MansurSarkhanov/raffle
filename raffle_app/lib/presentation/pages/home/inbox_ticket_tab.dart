import 'package:flutter/material.dart';

import '../../../shared/couple_buttons.dart';
import 'view/message_view.dart';
import 'view/ticket_view.dart';

class InboxTicketTab extends StatefulWidget {
  const InboxTicketTab({super.key, required this.size});
  final Size size;

  @override
  State<InboxTicketTab> createState() => _InboxTicketTabState();
}

class _InboxTicketTabState extends State<InboxTicketTab> {
  int curIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Widget> rafflesScreen = [
      const TicketView(),
      const MessagesScreen(),
    ];
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.08, left: size.width * 0.05, right: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Raffles',
            style: TextStyle(
              color: Colors.black,
              fontSize: 29,
              fontFamily: 'Helvetica Neue',
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: CoupleButtons(
              indexFromOut: curIndex,
              height: size.height * 0.045,
              buttonText1: 'Tickets',
              buttonText2: 'Messages',
              function: ({required index}) {
                print('index $index');
                setState(() {
                  curIndex = index;
                });
              },
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Expanded(
            child: rafflesScreen[curIndex],
          ),
        ],
      ),
    );
  }
}
