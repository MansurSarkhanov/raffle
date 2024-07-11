import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/notifier/app_index_notifier.dart';
import 'package:raffle_app/presentation/components/fab_button.dart';
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
    return Scaffold(
      extendBody: true,
      backgroundColor:
          context.watch<AppIndexNotifier>().state == AppPartSection.left
              ? const Color(0xFFEBEBEB)
              : const Color(0xFFF9F9F9),
      appBar: tabController.index == 2 ||
              tabController.index == 4 ||
              restorantTabController.index == 1 ||
              restorantTabController.index == 2 ||
              restorantTabController.index == 4
          ? null
          : CustomSelectionAppbar(
              controller: tabController,
            ),
      floatingActionButton:
        context.watch<AppIndexNotifier>().state==AppPartSection.right&&restorantTabController.index==0 ?const MapFabButton() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            left: 12.0, right: 12, bottom: Platform.isIOS ? 20 : 12),
        child: tabController.index == 2 ||
                restorantTabController.index == 2 ||
                tabController.index == 4 ||
                restorantTabController.index == 4
            ? null
            : context.watch<AppIndexNotifier>().state == AppPartSection.right
                ? RestorantBottomNavBar(tabController: restorantTabController)
                : BottomNavBar(tabController: tabController),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            bottom:
                tabController.index == 2 || restorantTabController.index == 2
                    ? 0
                    : 28.0),
        child: context.watch<AppIndexNotifier>().state == AppPartSection.right
            ? RestorantTabView(
                restorantTabController: restorantTabController,
              )
            : TabBarView(
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
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    restorantTabController.dispose();
    super.dispose();
  }
}
