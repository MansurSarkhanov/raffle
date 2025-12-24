import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/notifier/app_notifier.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/theme_ext.dart';

class TicketToggle extends StatelessWidget {
  final PageController controller;

  const TicketToggle({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final isLeftSelected = context.watch<AppNotifier>().ticketLeftSelected;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        height: 60.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 52.h,
              decoration: BoxDecoration(
                color: isLeftSelected ? const Color(0xFFD98940) : const Color(0xFF8C8C8C),
                borderRadius: BorderRadius.circular(42),
              ),
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment: isLeftSelected ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: 182.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(51),
                ),
              ),
            ),
            Row(
              children: [
                _buildToggleItem(
                  context,
                  text: AppLocalizations.of(context)!.active_ticket,
                  isSelected: isLeftSelected,
                  onTap: () {
                    context.read<AppNotifier>().toggleTicketSwither();
                    controller.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  },
                ),
                _buildToggleItem(
                  context,
                  text: AppLocalizations.of(context)!.expired_ticket,
                  isSelected: !isLeftSelected,
                  onTap: () {
                    context.read<AppNotifier>().toggleTicketSwither();
                    controller.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildToggleItem(BuildContext context,
      {required String text, required bool isSelected, required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Center(
          child: Text(
            text,
            style: context.typography.headlineBold.copyWith(
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
              letterSpacing: -.5,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
