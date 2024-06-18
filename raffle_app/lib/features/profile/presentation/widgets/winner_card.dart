import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/constants/colors.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

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
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 190,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFFEB595A),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleHeading1Widget(
                  text:
                  'Draw Result',
                  fontSize: 19.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TitleHeading1Widget(
                      text: 'Winner: ',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    TitleHeading1Widget(
                      text: nameOfWinner,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
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
                    TitleHeading1Widget(
                      text: 'Prize: ',
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    TitleHeading1Widget(
                      text: prizeName,
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleHeading1Widget(
                      text: 'Winning Ticket: ',
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    TitleHeading1Widget(
                      text: 'RR-00001-00000001',
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleHeading1Widget(
                      text: 'Draw date:',
                      color: Colors.white,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,

                    ),
                    TitleHeading1Widget(
                      text: ' June 15, 2024 5:25 PM',
                      color: Colors.white,
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                TitleHeading1Widget(
                    text: 'Please see the draw video on our social channels.',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 9.sp
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: -38,
            child: ClipOval(
              child: Container(
                color: AppColors.backColor,
                height: 54,
                width: 80,
              ),
            )),
        Positioned(
            left: -38,
            child: ClipOval(
              child: Container(
                color: AppColors.backColor,
                height: 72,
                width: 54,
              ),
            )
        ),
        Positioned(
            right: -38,
            child: ClipOval(
              child: Container(
                color: AppColors.backColor,
                height: 72,
                width: 54,
              ),
            )
        )
      ],
    );
  }
}
