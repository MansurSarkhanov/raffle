import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/profile/presentation/page/profile_page.dart';
import 'package:raffle_app/notifier/app_notifier.dart';
import 'package:raffle_app/raffle_co/view/draws_tab.dart';
import 'package:raffle_app/raffle_co/view/ticket_tab.dart';
import 'package:raffle_app/raffle_co/view/wallet_tab.dart';
import 'package:raffle_app/raffle_place/components/place_bottom_navbar.dart';
import 'package:raffle_app/raffle_place/raffle_place_page.dart';

import '../../../raffle_co/components/bottom_navbar.dart';
import '../../../raffle_co/view/home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  List<Widget> pages = [
    const HomeTab(),
    const DrawsTab(),
    const TicketTab(),
    const WalletTab(),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ZoomDrawer(
      borderRadius: 39,
      menuBackgroundColor: const Color(0xFF261C51),
      isRtl: true,
      style: DrawerStyle.defaultStyle,
      duration: const Duration(milliseconds: 300),
      mainScreenTapClose: true,
      slideWidth: size.width * 0.82,
      mainScreenScale: 0.15,
      menuScreenWidth: double.infinity,
      angle: 0.0,
      controller: context.watch<AppNotifier>().zoomDrawerController,
      menuScreen: const ProfilePage(),
      mainScreen: Scaffold(
        extendBody: true,
        bottomNavigationBar: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: context.watch<AppNotifier>().isLeftSelected
              ? const BottomNavBar()
              : PlaceBottomNavbar(tabController: controller),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: context.watch<AppNotifier>().isLeftSelected
                    ? pages[context.watch<AppNotifier>().currentPageIndex]
                    : RafflePlacePage(controller: controller),
              ),
              SizedBox(
                height: 112.h,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                    color: context.watch<AppNotifier>().currentPageIndex == 0
                        ? const Color(0xFF9D2727)
                        : context.watch<AppNotifier>().currentPageIndex == 1
                            ? const Color(0xFF08294F)
                            : context.watch<AppNotifier>().currentPageIndex == 2
                                ? context.watch<AppNotifier>().ticketLeftSelected
                                    ? const Color(0xFFFF603D)
                                    : const Color(0xFF595959)
                                : const Color(0xFF18852A),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SwipeAppBar(),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: InkWell(
                          onTap: () {
                            context.read<AppNotifier>().toggleDrawer();
                          },
                          child: SvgPicture.asset('assets/svg/user.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
