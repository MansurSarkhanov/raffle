import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/notifier/app_notifier.dart';

class PlaceBottomNavbar extends StatefulWidget {
  const PlaceBottomNavbar({
    super.key,
  });


  @override
  State<PlaceBottomNavbar> createState() => _PlaceBottomNavbarState();
}

class _PlaceBottomNavbarState extends State<PlaceBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.watch<AppNotifier>().coCurrentPageIndex == 2 ? Colors.transparent : Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 20),
        child: Container(
          height: 59,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.3),
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Provider.of<AppNotifier>(context, listen: false).coChangeTabIndex(0);
                    },
                    child: Tab(
                        text: "Restaurant",
                        icon: context.watch<AppNotifier>().coCurrentPageIndex == 0
                            ? SvgPicture.asset('assets/svg/ic_restorant_selected.svg')
                            : SvgPicture.asset('assets/svg/ic_restorant_unselected.svg')),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context.read<AppNotifier>().coChangeTabIndex(1);
                    },
                    child: Tab(
                        text: "Hotel",
                        icon: context.watch<AppNotifier>().coCurrentPageIndex == 1
                            ? SvgPicture.asset('assets/svg/ic_hotel_selected.svg')
                            : SvgPicture.asset('assets/svg/ic_hotel_unselected.svg')),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context.read<AppNotifier>().coChangeTabIndex(2);
                    },
                    child: Tab(
                        text: "Scan",
                        icon: context.watch<AppNotifier>().coCurrentPageIndex == 2
                            ? SvgPicture.asset(
                                'assets/svg/ic_scan_restorant.svg',
                                color: Colors.black,
                              )
                            : SvgPicture.asset('assets/svg/ic_scan_restorant.svg')),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context.read<AppNotifier>().coChangeTabIndex(3);
                    },
                    child: Tab(
                        text: "Shop",
                        icon: context.watch<AppNotifier>().coCurrentPageIndex == 3
                            ? SvgPicture.asset('assets/svg/ic_shop_selected.svg')
                            : SvgPicture.asset('assets/svg/ic_shop_unselected.svg')),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context.read<AppNotifier>().coChangeTabIndex(4);
                    },
                    child: Tab(
                        text: "Raffle",
                        icon: context.watch<AppNotifier>().coCurrentPageIndex == 4
                            ? SvgPicture.asset('assets/svg/ic_raffle_selected.svg')
                            : SvgPicture.asset('assets/svg/ic_raffle_unselected.svg')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
