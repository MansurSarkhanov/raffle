import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';

import '../../../shared/painter/liner_dash_painter.dart';
import '../../components/custom_text.dart';
import '../../components/gradient_text.dart';
import 'wallet_tab.dart';

class TicketTab extends StatefulWidget {
  const TicketTab({super.key});

  @override
  State<TicketTab> createState() => _TicketTabState();
}

class _TicketTabState extends State<TicketTab> {
  bool isLeftSelected = true;
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundColorCard(
            flex: 6,
            downColor: Colors.white,
            gradient: isLeftSelected
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFCE2B37),
                      Color(0xFFFF603D),
                      Color(0xFFFFFFFF),
                    ],
                  )
                : const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF595959),
                      Color(0xFF8D8D8D),
                      Color(0xFFFFFFFF),
                    ],
                  )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 64.0, left: 12),
              child: SwipeAppBar(),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "TICKETS",
                style: context.typography.body2Bold.copyWith(fontSize: 34, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 21),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(42),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: isLeftSelected ? const Color(0xFFD98940) : const Color(0xFF8C8C8C),
                      borderRadius: BorderRadius.circular(42),
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedAlign(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linearToEaseOut,
                          alignment: isLeftSelected ? Alignment.centerLeft : Alignment.centerRight,
                          child: Container(
                            width: 182.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(51),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Future.delayed(const Duration(microseconds: 100), () {
                                    isLeftSelected = true;
                                    setState(() {});
                                  });
                                  controller.animateToPage(0,
                                      duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                                },
                                child: Center(
                                  child: Text('Active Tickets',
                                      style: context.typography.headlineBold.copyWith(
                                          fontWeight: isLeftSelected ? FontWeight.w800 : FontWeight.w600,
                                          fontSize: 18.sp)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Future.delayed(const Duration(microseconds: 100), () {
                                    isLeftSelected = false;
                                    setState(() {});
                                  });
                                  controller.animateToPage(1,
                                      duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                                },
                                child: Center(
                                  child: Text(
                                    'Expired Tickets',
                                    style: context.typography.headlineBold.copyWith(
                                        fontWeight: isLeftSelected ? FontWeight.w600 : FontWeight.w800,
                                        fontSize: 18.sp),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 64),
                    child: TicketCards(),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 64),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 80, width: 80, child: Image.asset('assets/images/im_ticket.png')),
                            const SizedBox(
                              height: 16,
                            ),
                            Text('You can see your Active Tickets here after youhave made a purchase',
                                textAlign: TextAlign.center,
                                style: context.typography.headlineBold
                                    .copyWith(fontWeight: FontWeight.w500, fontSize: 13.sp))
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class TicketCards extends StatelessWidget {
  const TicketCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                blurRadius: 50.3,
                spreadRadius: 10,
                offset: const Offset(0, 4),
                color: Colors.black.withOpacity(0.25),
              )
            ]),
            child: Image.asset('assets/images/ticket.png')),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 24, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/im_raffle_logo.png',
                        height: 27,
                        width: 27,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      GradientText(
                        'raffle',
                        style: context.typography.body2Bold.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFCE2B37),
                            Color(0xFFFFCE0B),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFCE2B37),
                          Color(0xFFF09A1A),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.5),
                      child: Center(
                        child: Text(
                          '4',
                          style: context.typography.body2Bold.copyWith(fontSize: 19, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Prize: AZN2,000 Cash',
                    style: context.typography.body2Regular.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Product: Voucher AZN50",
                    style: context.typography.body2Regular.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Issued on:",
                    style: context.typography.body2Regular.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "27 June 2024, 05:25 PM",
                    style: context.typography.body2Regular.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
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
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.65, right: 15.8, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.access_time_filled_rounded,
                          size: 22,
                          color: Color(0xFF7D7D7D),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Row(
                          children: [
                            Text(
                              "Sold out.",
                              style:
                                  context.typography.body2Regular.copyWith(fontSize: 10, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Draw on 15 June",
                              style:
                                  context.typography.body2Regular.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 6,),
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
      ],
    );
  }
}
