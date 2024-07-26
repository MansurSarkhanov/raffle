import 'package:flutter/material.dart';

import '../../../../raffle_co/widgets/live_winner_widget.dart';
import '../../../../raffle_co/widgets/live_winning_widget.dart';
import '../../../../shared/couple_buttons.dart';
import 'watch_live_view.dart';

class LiveView extends StatefulWidget {
  const LiveView({super.key});

  @override
  State<LiveView> createState() => _LiveViewState();
}

class _LiveViewState extends State<LiveView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: size.height * 0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Live Draws',
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Helvetica Neue',
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  LiveWinnerWidget(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const WatchLiveScreen(
                              videoUrl: 'https://emiland.com/front/videos/Emiland_Header.mp4',
                              date: '17 June 2023',
                              time: '10:00 AM'),
                        ));
                      },
                      isActive: true,
                      date: '17th June 2023',
                      imageUrl: 'assets/images/im_girl.png',
                      time: '10:00 AM'),
                  LiveWinnerWidget(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const WatchLiveScreen(
                              videoUrl:
                                  'https://firebasestorage.googleapis.com/v0/b/raffle-1b71c.appspot.com/o/videos%2F1%20Minute%20of%20PARIS.mp4?alt=media&token=49e29a28-7a21-43e1-8f90-059f43b96240',
                              date: '17 June 2022',
                              time: '10:00 AM'),
                        ));
                      },
                      isActive: true,
                      date: '17th June 2022',
                      imageUrl: 'assets/images/im_boy.png',
                      time: '10:00 AM'),
                  LiveWinnerWidget(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const WatchLiveScreen(
                              videoUrl:
                                  'https://firebasestorage.googleapis.com/v0/b/raffle-1b71c.appspot.com/o/videos%2FThe%20secret%20to%20building%20flutter%20UI%20%23shorts.mp4?alt=media&token=c8827fc4-43af-4616-836d-8aec4d7a4e1f',
                              date: '17 June 2021',
                              time: '10:00 AM'),
                        ));
                      },
                      isActive: false,
                      date: '17th June 2021',
                      imageUrl: 'assets/images/im_winner.png',
                      time: '10:00 AM'),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: CoupleButtons(
                indexFromOut: 0,
                height: size.height * 0.05,
                buttonText1: 'Winners',
                buttonText2: 'Upcoming Draws',
                function: ({required index}) {},
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            const LiveWinningWidget(
              announcedOn: 'June 17.2023 10:00 AM',
              imageUrl:
                  'https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
              prize: 'Fiat 500 La Prima',
              ticketNumber: 'XXBBSS',
              winningPerson: 'Sevinj Tairova',
              youWillWin: 'Fiat 500',
            ),
            const LiveWinningWidget(
              announcedOn: 'June 17.2023 10:00 AM',
              imageUrl:
                  'https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80',
              prize: 'Fiat 500 La Prima',
              ticketNumber: 'XXBBSS',
              winningPerson: 'Sevinj Tairova',
              youWillWin: 'Fiat 500',
            ),
          ],
        ),
      ),
    );
  }
}
