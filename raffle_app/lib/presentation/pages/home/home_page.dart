import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/profile/presentation/page/profile_page.dart';
import 'package:raffle_app/notifier/app_notifier.dart';
import 'package:raffle_app/presentation/pages/home/draws_tab.dart';
import 'package:raffle_app/presentation/pages/home/ticket_tab.dart';
import 'package:raffle_app/presentation/pages/home/wallet_tab.dart';

import '../../components/bottom_navbar.dart';
import 'home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
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
          backgroundColor: context.watch<AppNotifier>().currentPageIndex == 0
              ? const Color(0xFF9D2727)
              : context.watch<AppNotifier>().currentPageIndex == 1
                  ? const Color(0xFF08294F)
                  : const Color(0xFF147923),
          bottomNavigationBar: const BottomNavBar(),
          body: pages[context.watch<AppNotifier>().currentPageIndex]
      ),
    );
  }
}
