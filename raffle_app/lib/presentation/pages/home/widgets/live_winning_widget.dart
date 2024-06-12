import 'package:flutter/material.dart';

class LiveWinningWidget extends StatelessWidget {
  final String imageUrl;
  final String youWillWin;
  final String winningPerson;
  final String prize;
  final String ticketNumber;
  final String announcedOn;
  const LiveWinningWidget({
    super.key,
    required this.announcedOn,
    required this.imageUrl,
    required this.prize,
    required this.ticketNumber,
    required this.winningPerson,
    required this.youWillWin,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.55,
          width: size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Colors.white),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.015,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: size.height * 0.3,
                    width: size.width * 0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              imageUrl,
                            ))),
                  ),
                  // Positioned(
                  //   top: size.height * 0.2,
                  //   right: size.width * 0.03,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     children: [
                  //       Text(
                  //         'WIN',
                  //         textAlign: TextAlign.right,
                  //         style: TextStyle(
                  //             fontSize: 24,
                  //             fontWeight: FontWeight.w700,
                  //             color: AppColors.standartWhiteColor),
                  //       ),
                  //       Container(
                  //         alignment: Alignment.centerRight,
                  //         width: MediaQuery.of(context).size.width * 0.8,
                  //         child: Text(
                  //           youWillWin,
                  //           textAlign: TextAlign.right,
                  //           overflow: TextOverflow.ellipsis,
                  //           maxLines: 1,
                  //           style: const TextStyle(
                  //               fontSize: 22,
                  //               fontWeight: FontWeight.w700,
                  //               color: Color(0xFF8DC0CA)),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // )
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                  width: size.width * 0.8,
                  child: const Text(
                    'Congratulations',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Color(0xFFFF3F40)),
                  )),
              // SizedBox(
              //   height: size.height * 0.01,
              // ),
              SizedBox(
                width: size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          winningPerson,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        const Text(
                          ' on winning',
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                        ),
                      ],
                    ),
                    Text(
                      prize,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Ticket no.',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        Text(
                          ticketNumber,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    // const Text(
                    //   'Announced on:',
                    //   style: TextStyle(
                    //       color: Color(0xFFA2A2A2),
                    //       fontWeight: FontWeight.w500,
                    //       fontSize: 14),
                    // ),
                    Text(
                      announcedOn,
                      style: const TextStyle(color: Color(0xFFA2A2A2), fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
      ],
    );
  }
}
