import 'package:flutter/material.dart';
import 'package:raffle_app/core/constants/colors.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

import '../../../../shared/painter/liner_dash_painter.dart';

class TicketWinnerCard extends StatelessWidget {
  const TicketWinnerCard({super.key, this.isBackitem = false});
  final bool? isBackitem;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(10, 10),
            blurRadius: 10,
            spreadRadius: -3,
            color: Colors.transparent,
          ),
          BoxShadow(
            offset: Offset(-10, 10),
            blurRadius: 10,
            spreadRadius: -3,
            color: Colors.transparent,

          ),
        ],
      ),
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFFFEFEFE),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 19, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(color: backColor, borderRadius: BorderRadius.circular(33)),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8),
                            child: Text(
                              'Restaurants By\n Emin Agalarov',
                              style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 21.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Prize: AZN2,000 Cash',
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Product: Voucher AZN50",
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "Issued on:",
                        style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "27 June 2024, 05:25 PM",
                        style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 4,
                  child: CustomPaint(
                    painter: DashedLinePainter(),
                    size: const Size(double.infinity, 2),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.65, right: 15.8, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            isBackitem == true
                                ? SizedBox.fromSize()
                                : const Icon(
                                    Icons.access_time_filled_rounded,
                                    size: 22,
                                    color: Color(0xFF7D7D7D),
                                  ),
                            const SizedBox(
                              width: 6,
                            ),
                        
                            isBackitem == true
                                ? const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TitleHeading1Widget(
                                        text: 'Issued on: ',
                                        fontSize: 9,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      TitleHeading1Widget(
                                        text: '4 Jan 2024, 05:25 PM',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ],
                                  )
                                : const Row(
                                    children: [
                                      Text(
                                        "Sold out.",
                                        style:
                                            TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        " Draw on 15 June,",
                                        style: TextStyle(color: Colors.black, fontSize: 10),
                                      )
                                    ],
                                  ),
                          ],
                        ),
                      ),
                      const Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleHeading1Widget(
                                text: 'Ticket No.',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                              TitleHeading1Widget(
                                text: 'RR-00001-00000001',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: -42,
            child: ClipOval(
              // clipper: CustomClip(),
              child: Container(
                color: Colors.transparent,
                height: 80,
                width: 55,
              ),
            ),
          ),
          Positioned(
            right: -42,
            child: ClipOval(
              child: Container(
                color: Colors.transparent,
                height: 80,
                width: 55,
              ),
            ),
          ),
          Positioned(
            top: -42,
            child: ClipOval(
              // clipper: CustomClip(),
              child: Container(
                color: Colors.transparent,
                height: 55,
                width: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
