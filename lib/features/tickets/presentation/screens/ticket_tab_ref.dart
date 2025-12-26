import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/features/tickets/presentation/screens/ticket_cards.dart';
import 'package:raffle_app/features/tickets/presentation/screens/ticket_toggle.dart';
import 'package:raffle_app/notifier/app_notifier.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../raffle_co/view/wallet_tab.dart';
import '../notifier/ticket_provider.dart';

class TicketTabRef extends StatefulWidget {
  const TicketTabRef({super.key});

  @override
  State<TicketTabRef> createState() => _TicketTabState();
}

class _TicketTabState extends State<TicketTabRef> {
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TicketProvider>().watchUserTickets();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLeftSelected = context.watch<AppNotifier>().ticketLeftSelected;

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
                ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 112.h),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                AppLocalizations.of(context)!.ticket,
                style: context.typography.body2Bold.copyWith(
                  fontSize: 34.sp,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -.9,
                  height: 34 / 40,
                ),
              ),
            ),
            const SizedBox(height: 24),
            TicketToggle(controller: _controller),
            const SizedBox(height: 8),
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 120),
                    child: Column(
                        children: List.generate(
                      2,
                      (index) => TicketCards(),
                    )),
                  ),
                  _EmptyTicketView(),
                  
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class _EmptyTicketView extends StatelessWidget {
  const _EmptyTicketView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 64),
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/im_ticket.png', height: 80, width: 80),
            const SizedBox(height: 16),
            Text(
              'You can see your Active Tickets here after you have made a purchase',
              textAlign: TextAlign.center,
              style: context.typography.headlineBold.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
