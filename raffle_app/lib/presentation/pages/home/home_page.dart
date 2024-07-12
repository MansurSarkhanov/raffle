import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/profile/presentation/page/profile_page.dart';
import 'package:raffle_app/notifier/app_index_notifier.dart';
import 'package:raffle_app/presentation/pages/home/view/live_view.dart';
import 'package:raffle_app/presentation/pages/home/view/offer_view.dart';

import '../../../features/restaurants/presentation/page/restorant_tabview.dart';
import '../../components/bottom_navbar.dart';
import '../../components/custom_selection_appbar.dart';
import 'home_tab.dart';
import 'inbox_ticket_tab.dart';
import 'test_scan.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;
  late final TabController restorantTabController;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    restorantTabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      print('first chnage');
      setState(() {});
    });
    restorantTabController.addListener(() {
      print('second chnage');

      setState(() {});
    });
  }


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
      controller: context.watch<AppIndexNotifier>().zoomDrawerController,
      menuScreen: const ProfilePage(),
      mainScreen: Scaffold(
        extendBody: true,
        backgroundColor:
             const Color(0xFF9D2727),
        appBar: CustomSelectionAppbar(
          controller: tabController,
        ),
        bottomNavigationBar: BottomNavBar(tabController: tabController),
        body: context.watch<AppIndexNotifier>().state == AppPartSection.right
            ? RestorantTabView(
                restorantTabController: restorantTabController,
              )
            : Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF9D2727),
                      Color(0xFFCE2B37),
                      Color(0xFFFFFFFF),
                      Color(0xFFEEEEEE),
                      Color(0xFFEEEEEE),
                    ],
                  ),
                ),
                child: TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    HomeTab(
                      size: size,
                      controller: tabController,
                    ),
                    const LiveView(),
                    QRCodeScreen(controller: tabController),
                    const OfferView(),
                    InboxTicketTab(
                      controller: tabController,
                    )
                  ],
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    restorantTabController.dispose();
    super.dispose();
  }
}
