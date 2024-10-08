import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/notifier/app_notifier.dart';
import 'package:raffle_app/presentation/components/go_back_button.dart';

import '../../../shared/couple_buttons.dart';
import 'view/message_view.dart';
import 'view/ticket_view.dart';

class InboxTicketTab extends StatefulWidget {
  const InboxTicketTab({super.key});

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
    return Container(
      color: const Color(0xFFEBEBEB),
      child: Padding(
        padding: EdgeInsets.only(top: Platform.isIOS ? 56 : 40, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Consumer<AppNotifier>(
                  builder: (context, notifier, child) {
                    return GoBackButton(
                        buttonBackColor: const Color(0xFFD9D9D9),
                        onPressed: () {
                      
                        });
                  },
                ),
                Text(
                  'Raffles',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.sp,
                    fontFamily: 'Helvetica Neue',
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
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
            Expanded(
              child: rafflesScreen[curIndex],
            ),
          ],
        ),
      ),
    );
  }
}
