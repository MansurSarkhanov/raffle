import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceBottomNavbar extends StatefulWidget {
  const PlaceBottomNavbar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<PlaceBottomNavbar> createState() => _PlaceBottomNavbarState();
}

class _PlaceBottomNavbarState extends State<PlaceBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 20),
        child: Container(
          height: 59,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.3),
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
            // boxShadow: [
            //   BoxShadow(color: Colors.grey.shade500, blurRadius: 20, spreadRadius: 1, offset: const Offset(0, 0))
            // ],
          ),
          child: TabBar(
            onTap: (value) {
              widget.tabController.index = value;
            },
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
                      : SvgPicture.asset('assets/svg/ic_restorant_unselected.svg')),
              Tab(
                  text: "Hotel",
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
        ),
      ),
    );
  }
}
