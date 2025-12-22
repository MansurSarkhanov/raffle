import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/features/tickets/data/models/ticket_model.dart';
import 'package:raffle_app/features/tickets/presentation/notifier/ticket_state.dart';
import 'package:raffle_app/notifier/app_notifier.dart';

import '../../features/tickets/presentation/notifier/ticket_provider.dart';
import '../../l10n/app_localizations.dart';
import '../../presentation/components/custom_text.dart';
import '../../presentation/components/gradient_text.dart';
import '../../shared/painter/liner_dash_painter.dart';
import 'wallet_tab.dart';

class TicketTab extends StatefulWidget {
  const TicketTab({super.key});

  @override
  State<TicketTab> createState() => _TicketTabState();
}

class _TicketTabState extends State<TicketTab> {
  final PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    context.read<TicketProvider>().getUserTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundColorCard(
            flex: 6,
            downColor: Colors.white,
            gradient: context.watch<AppNotifier>().ticketLeftSelected
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFF603D),
                      Color(0xFFFF603D),
                      Color(0xFFCE2B37),
                      Color(0xFFFFFFFF),
                    ],
                  )
                : const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF595959),
                      Color(0xFF595959),
                      Color(0xFF8D8D8D),
                      Color(0xFFFFFFFF),
                    ],
                  )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 112.h,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                AppLocalizations.of(context)!.ticket,
                style: context.typography.body2Bold.copyWith(
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -.9,
                    height: 34 / 40),
              ),
            ),
            const SizedBox(height: 24),
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
                      color: context.watch<AppNotifier>().ticketLeftSelected
                          ? const Color(0xFFD98940)
                          : const Color(0xFF8C8C8C),
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
                          alignment:
                              context.watch<AppNotifier>().ticketLeftSelected
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
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
                                  Future.delayed(
                                      const Duration(microseconds: 100), () {
                                    context
                                        .read<AppNotifier>()
                                        .toggleTicketSwither();
                                  });
                                  controller.animateToPage(0,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                },
                                child: Center(
                                  child: Text(
                                      AppLocalizations.of(context)!
                                          .active_ticket,
                                      style: context.typography.headlineBold
                                          .copyWith(
                                              fontWeight: context
                                                      .watch<AppNotifier>()
                                                      .ticketLeftSelected
                                                  ? FontWeight.w800
                                                  : FontWeight.w600,
                                              letterSpacing: -.5,
                                              fontSize: 18.sp)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  Future.delayed(
                                      const Duration(microseconds: 100), () {
                                    context
                                        .read<AppNotifier>()
                                        .toggleTicketSwither();
                                  });
                                  controller.animateToPage(1,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                },
                                child: Center(
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .expired_ticket,
                                    style: context.typography.headlineBold
                                        .copyWith(
                                            fontWeight: context
                                                    .watch<AppNotifier>()
                                                    .ticketLeftSelected
                                                ? FontWeight.w600
                                                : FontWeight.w800,
                                            letterSpacing: -.5,
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
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  TicketCards(),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 64),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 80,
                                width: 80,
                                child:
                                    Image.asset('assets/images/im_ticket.png')),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                                'You can see your Active Tickets here after youhave made a purchase',
                                textAlign: TextAlign.center,
                                style: context.typography.headlineBold.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp))
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

class TicketCards extends StatefulWidget {
  const TicketCards({
    super.key,
  });

  @override
  State<TicketCards> createState() => _TicketCardsState();
}

class _TicketCardsState extends State<TicketCards> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    const double overlap = 48;

    return Consumer<TicketProvider>(
      builder: (context, provider, child) {
        if (provider.state is TicketProgress) {
          return CircularProgressIndicator();
        } else if (provider.state is TicketSuccess) {
          final ticketList = provider.state as TicketSuccess;
          final listView = ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 150, top: 24),
            itemCount: ticketList.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 8,
                  left: 16,
                  right: 16,
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isExpanded = false;
                    });
                  },
                  child: _buildTicketCard(context,
                      shadow: false, ticket: ticketList.data[index]),
                ),
              );
            },
          );
          final stackView = Stack(
            alignment: Alignment.topCenter,
            children: List.generate(ticketList.data.length, (index) {
              int reverseIndex = ticketList.data.length - 1 - index;
              return Positioned(
                top: reverseIndex * overlap,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          isExpanded = true;
                        });
                      },
                      child: _buildTicketCard(context,
                          shadow: true, ticket: ticketList.data[index])),
                ),
              );
            }),
          );
          return AnimatedCrossFade(
            firstChild: stackView,
            secondChild: listView,
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 800),
            firstCurve: Curves.easeInOut,
            secondCurve: Curves.easeInOut,
          );
        }
        return SizedBox.shrink();
      },
    );
  }

  Widget _buildTicketCard(BuildContext context,
      {required bool shadow, required TicketModel ticket}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/ticket.png',
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: shadow
            ? [
                BoxShadow(
                  blurRadius: 50.3,
                  spreadRadius: 10,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.25),
                )
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 24, right: 9.5),
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
                      style: context.typography.body2Bold
                          .copyWith(fontSize: 17, fontWeight: FontWeight.w600),
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
                        '5',
                        style: context.typography.body2Bold
                            .copyWith(fontSize: 19, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Prize: AZN${ticket.price} Cash',
                  style: context.typography.body2Regular.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  "Product:${ticket.product}",
                  style: context.typography.body2Regular.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Issued on:",
                  style: context.typography.body2Regular.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  ticket.issuedOn,
                  style: context.typography.body2Regular.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 4,
            child: CustomPaint(
              painter: DashedLinePainter(),
              size: const Size(double.infinity, 2),
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 14.65, right: 15.8, bottom: 10),
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
                            style: context.typography.body2Regular.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.5,
                            ),
                          ),
                          Text(
                            ticket.soldOut,
                            style: context.typography.body2Regular.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.5,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleHeading1Widget(
                          text: 'Ticket No.',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.5,
                        ),
                        TitleHeading1Widget(
                          text: ticket.ticketNo,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0,
                        ),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
