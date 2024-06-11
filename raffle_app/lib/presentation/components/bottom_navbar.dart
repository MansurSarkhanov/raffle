import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xFFF9F9F9),
        boxShadow: const [BoxShadow(color: Color(0xFF505050), blurRadius: 20, spreadRadius: 10, offset: Offset(0, 5))],
      ),
      child: TabBar(
        onTap: (value) {
          print(value);
          tabController.index = value;
        },
        splashBorderRadius: BorderRadius.circular(18),
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        controller: tabController,
        labelPadding: EdgeInsets.zero,
        labelColor: const Color(0xFF505050),
        labelStyle: const TextStyle(fontSize: 9, color: Color(0xFF505050), fontWeight: FontWeight.w400),
        tabs: [
          Tab(
            text: "Home",
            icon: SvgPicture.asset(
              'assets/svg/home_active.svg',
              height: 20,
              width: 21,
            ),
          ),
          Tab(
            text: "Live",
            icon: SvgPicture.asset(
              'assets/svg/live.svg',
              height: 17,
              width: 21,
            ),
          ),
          const Tab(text: "Scan", icon: SizedBox(height: 15)),
          Tab(
            text: "Offer",
            icon: SvgPicture.asset(
              'assets/svg/offer.svg',
              height: 20,
              width: 20,
            ),
          ),
          Tab(
            text: "Inbox",
            icon: SvgPicture.asset(
              'assets/svg/inbox.svg',
              height: 15,
              width: 21,
            ),
          ),
        ],
      ),
    );
  }
}
