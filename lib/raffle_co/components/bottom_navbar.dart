import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/notifier/app_notifier.dart';
import 'package:raffle_app/presentation/pages/home/test_scan.dart';

import '../../l10n/app_localizations.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    // required this.tabController,
  });

  // final TabController tabController;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4.3,
            offset: const Offset(0, 4),
            color: Colors.white.withOpacity(0.25),
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            const Color(0xFFEEEEEE),
            const Color(0xFFEEEEEE),
            const Color(0xFFEEEEEE),
            const Color(0xFFEEEEEE),
            const Color(0xFFEEEEEE),
            const Color(0xFFEEEEEE),
            const Color(0xFFEEEEEE).withOpacity(0.6),
            const Color(0xFFEEEEEE).withOpacity(0.5),
            const Color(0xFFEEEEEE).withOpacity(0.01),
          ],
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16, bottom: 10),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TabBarItem(
                index: 0,
                imagePath: 'home',
                text: AppLocalizations.of(context)!.home,
                onPress: () {
                  context.read<AppNotifier>().changeTabIndex(0);
                },
              ),
              TabBarItem(
                index: 1,
                imagePath: 'draws',
                text: AppLocalizations.of(context)!.draws,
                onPress: () {
                  context.read<AppNotifier>().changeTabIndex(1);
                },
              ),
              TabBarItem(
                index: 4,
                imagePath: 'ic_scan_restorant',
                text: "Scan",
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const QRCodeScreen();
                    },
                  ));
                },
              ),
              TabBarItem(
                index: 2,
                imagePath: 'ticket',
                text: AppLocalizations.of(context)!.ticket,
                onPress: () {
                  context.read<AppNotifier>().changeTabIndex(2);
                },
              ),
              TabBarItem(
                index: 3,
                imagePath: 'wallet',
                text: AppLocalizations.of(context)!.wallet,
                onPress: () {
                  context.read<AppNotifier>().changeTabIndex(3);
                },
              ),
              TabBarItem(
                index: 5,
                onPress: () {
                  context.read<AppNotifier>().toggleDrawer();
                },
                imagePath: 'more',
                text: AppLocalizations.of(context)!.menu,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShopModalSheet extends StatelessWidget {
  const ShopModalSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color(0xFFEEEEEE),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: Container(
              height: 3,
              width: 55,
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(44)),
            ),
          ),
          const SizedBox(
            height: 163,
          ),
          SvgPicture.asset('assets/svg/ic_bag.svg'),
          const SizedBox(
            height: 24,
          ),
          Text(
            "No products have been added to your\nbag yet.",
            textAlign: TextAlign.center,
            style: context.typography.body2Bold.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    super.key,
    required this.text,
    required this.imagePath,
    required this.onPress,
    required this.index,
  });

  final String text;
  final String imagePath;
  final VoidCallback onPress;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0, bottom: 12.0),
          child: InkWell(
            onTap: onPress,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
               
              ),
              child: SizedBox(
                width: 68.0.dm,
                child: Tab(
                  
                  icon: SvgPicture.asset('assets/svg/$imagePath.svg'),
                  child: Text(
                    text,
                    style: context.typography.body2Bold.copyWith(color: const Color(0xFF747474), fontSize: 10),
                  ),
                ),
              ),
            ),
          ),
        ),
        index == context.watch<AppNotifier>().currentPageIndex
            ? Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    height: 6,
                    width: 10,
                    decoration: BoxDecoration(color: const Color(0xFFEC008B), borderRadius: BorderRadius.circular(4)),
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Container(
                  height: 6,
                  width: 10,
                  decoration: const BoxDecoration(color: Colors.transparent, shape: BoxShape.circle),
                ),
              )
      ],
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
                  : SvgPicture.asset('assets/svg/ic_restorant_unselected.svg')),
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
