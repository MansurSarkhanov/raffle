import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/profile/presentation/page/profile_page.dart';
import 'package:raffle_app/notifier/app_index_notifier.dart';

import '../../components/bottom_navbar.dart';
import 'home_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late final TabController tabController;
  // late final TabController restorantTabController;
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   tabController = TabController(length: 5, vsync: this);
  //   restorantTabController = TabController(length: 5, vsync: this);
  //   tabController.addListener(() {
  //     print('first chnage');
  //     setState(() {});
  //   });
  //   restorantTabController.addListener(() {
  //     print('second chnage');

  //     setState(() {});
  //   });
  // }

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
        backgroundColor: const Color(0xFF9D2727),
        // appBar: const CustomSelectionAppbar(),
        bottomNavigationBar: const BottomNavBar(),
        body:
            //  context.watch<AppIndexNotifier>().state == AppPartSection.right
            // ? RestorantTabView(
            //     restorantTabController: restorantTabController,
            //   )
            // :
            HomeTab(
          size: size,
        ),
      ),
    );
  }

  // @override
  // void dispose() {
  //   tabController.dispose();
  //   restorantTabController.dispose();
  //   super.dispose();
  // }
}
