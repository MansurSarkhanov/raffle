import 'dart:io';

import 'package:flutter/material.dart';
import 'package:raffle_app/presentation/pages/home/scan_page.dart';
import 'package:raffle_app/presentation/pages/home/view/live_view.dart';
import 'package:raffle_app/presentation/pages/home/view/offer_view.dart';

import '../../components/bottom_navbar.dart';
import '../../components/custom_selection_appbar.dart';
import '../../components/fab_button.dart';
import 'home_tab.dart';
import 'inbox_ticket_tab.dart';
import 'view/restorant/restorant_tabview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;
  late final TabController restorantTabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    restorantTabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      setState(() {});

    });
    restorantTabController.addListener(() {
      if (restorantTabController.index == 2) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const ScanPage();
          },
        ));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: tabController.index == 2 ? const Color(0xFFF9F9F9) : const Color(0xFFEBEBEB),
      appBar: tabController.index == 0 || tabController.index == 2
          ? restorantTabController.index == 1 || restorantTabController.index == 4
              ? null
              : CustomSelectionAppbar(
                  controller: tabController,
                )
              
          : null,
      floatingActionButton: tabController.index == 2 
          ? restorantTabController.index == 4
              ? null
              : const RestorantFabButton()
          : tabController.index == 4
              ? null
              : const FabButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 12.0, right: 12, bottom: Platform.isIOS ? 24 : 12),
        child: tabController.index == 2
            ? restorantTabController.index == 4
                ? null
                : RestorantBottomNavBar(tabController: restorantTabController)
            : tabController.index == 4
                ? null
                : BottomNavBar(tabController: tabController),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeTab(
              size: size,
              controller: tabController,
            ),
            const LiveView(),
            RestorantTabView(restorantTabController: restorantTabController),
            const OfferView(),
            InboxTicketTab(
              controller: tabController,
            )
          ],
        ),
      ),
    );
  }
}
