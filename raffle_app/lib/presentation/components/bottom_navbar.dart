import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xFFF9F9F9),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade500, blurRadius: 20, spreadRadius: 1, offset: const Offset(0, 0))
        ],
      ),
      child: TabBar(
        // onTap: (value) {
        //   print(value);
        //   if (value == 2) {
        //     return;
        //   }
        //   widget.tabController.index = value;
        // },
        splashBorderRadius: BorderRadius.circular(18),
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        controller: widget.tabController,
        labelPadding: EdgeInsets.zero,
        labelColor: const Color(0xFF505050),
        labelStyle: const TextStyle(
            fontSize: 9, color: Color(0xFF505050), fontWeight: FontWeight.w400, fontFamily: 'Helvetica'),
        tabs: [
          Tab(
            text: "Home",
            icon: widget.tabController.index == 0
                ? SvgPicture.asset('assets/svg/ic_home_selected.svg')
                : SvgPicture.asset('assets/svg/ic_home_unselected.svg'),
          ),
          Tab(
              text: "Live",
              icon: widget.tabController.index == 1
                  ? SvgPicture.asset('assets/svg/ic_live_selected.svg')
                  : SvgPicture.asset('assets/svg/ic_live_unselected.svg')),
          Tab(
              text: "Scan",
              icon: widget.tabController.index == 2
                  ? SvgPicture.asset('assets/svg/ic_scan_restorant.svg')
                  : SvgPicture.asset('assets/svg/ic_scan_restorant.svg')),
          Tab(
              text: "Offer",
              icon: widget.tabController.index == 3
                  ? SvgPicture.asset('assets/svg/ic_offer_selected.svg')
                  : SvgPicture.asset('assets/svg/ic_offer_unselected.svg')),
          Tab(
              text: "Inbox",
              icon: widget.tabController.index == 4
                  ? SvgPicture.asset('assets/svg/ic_raffle_selected.svg')
                  : SvgPicture.asset('assets/svg/ic_raffle_unselected.svg')),
        ],
      ),
    );
  }
}

class RestorantBottomNavBar extends StatefulWidget {
  const RestorantBottomNavBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<RestorantBottomNavBar> createState() => _RestorantBottomNavBarState();
}

class _RestorantBottomNavBarState extends State<RestorantBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: widget.tabController.index == 1 ? const Color(0xFFF5F5F5) : const Color(0xFFF9F9F9),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade500, blurRadius: 20, spreadRadius: 1, offset: const Offset(0, 0))
        ],
      ),
      child: TabBar(
        onTap: (value) {
          widget.tabController.index = value;
          setState(() {});
        },
        tabAlignment: TabAlignment.fill,
        splashBorderRadius: BorderRadius.circular(18),
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        controller: widget.tabController,
        labelPadding: EdgeInsets.zero,
        labelColor: const Color(0xFF505050),
        labelStyle: const TextStyle(
            fontSize: 9, color: Color(0xFF505050), fontWeight: FontWeight.w400, fontFamily: 'Helvetica'),
        tabs: [
          Tab(
            text: "Restaurant",
            icon: widget.tabController.index == 0
                  ? SvgPicture.asset('assets/svg/ic_restorant_selected.svg')
                  : SvgPicture.asset('assets/svg/ic_restorant_unselected.svg')

          ),
          Tab(

              text: " Hotels",
              icon: widget.tabController.index == 1
                  ? SvgPicture.asset('assets/svg/ic_hotel_selected.svg')
                  : SvgPicture.asset('assets/svg/ic_hotel_unselected.svg')),
          Tab(
              text: "Scan",
              icon: widget.tabController.index == 2
                  ? SvgPicture.asset('assets/svg/ic_scan_restorant.svg')
                  : SvgPicture.asset('assets/svg/ic_scan_restorant.svg')),
             
          Tab(
              text: "Shop",
              icon: widget.tabController.index == 3
                  ? SvgPicture.asset('assets/svg/ic_shop_selected.svg')
                  : SvgPicture.asset('assets/svg/ic_shop_unselected.svg')),
          Tab(
              text: "Raffle",
              icon: widget.tabController.index == 4
                  ? SvgPicture.asset('assets/svg/ic_raffle_selected.svg')
                  : SvgPicture.asset('assets/svg/ic_raffle_unselected.svg'))
        ],
      ),
    );
  }
}
