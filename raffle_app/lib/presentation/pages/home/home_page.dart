import 'package:flutter/material.dart';
import 'package:raffle_app/presentation/pages/home/view/live_view.dart';

import '../../components/bottom_navbar.dart';
import '../../components/custom_selection_appbar.dart';
import '../../components/fab_button.dart';
import 'home_tab.dart';
import 'inbox_ticket_tab.dart';
import 'view/restorant_tabview.dart';

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
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFEBEBEB),
      appBar: tabController.index == 4 || tabController.index == 1
          ? null
          : CustomSelectionAppbar(
              controller: tabController,
            ),
      floatingActionButton: tabController.index == 2 ? null : const FabButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12, bottom: 12),
        child: tabController.index == 2
            ? RestorantBottomNavBar(tabController: restorantTabController)
            : BottomNavBar(tabController: tabController),
      ),
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeTab(size: size),
          const LiveView(),
          const RestorantTabView(),
          HomeTab(size: size),
          InboxTicketTab(size: size),
        ],
      ),
    );
  }
}
