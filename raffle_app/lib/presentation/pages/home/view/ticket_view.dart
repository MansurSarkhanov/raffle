import 'package:flutter/material.dart';

class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: SizedBox(height: 50, width: 50, child: Image.asset('assets/images/im_ticket.png')),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'You can see your Active Tickets here after you\nhave made a purchase',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF494949),
              fontSize: 15,
              fontFamily: 'Helvetica Neue',
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
