import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/notifier/app_notifier.dart';
import 'package:raffle_app/presentation/pages/home/view/hotel/hotels_view.dart';
import 'package:raffle_app/raffle_place/components/restourant_grid_view.dart';

import '../features/restaurants/presentation/page/restaurant_list_view.dart';
import '../presentation/pages/home/test_scan.dart';
import '../presentation/pages/wallet/wallet_card_page.dart';

class RafflePlacePage extends StatefulWidget {
  const RafflePlacePage({super.key});

  @override
  State<RafflePlacePage> createState() => _RafflePlacePageState();
}

class _RafflePlacePageState extends State<RafflePlacePage> {
  List<Widget> pages = [
    const RestaurantTab(),
    const HotelsView(),
    const QRCodeScreen(),
    Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          'Cooming Soon',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    ),
    const WalletCardPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[context.watch<AppNotifier>().coCurrentPageIndex],
    );
  }
}

class RestaurantTab extends StatefulWidget {
  const RestaurantTab({
    super.key,
  });

  @override
  State<RestaurantTab> createState() => _RestaurantTabState();
}

class _RestaurantTabState extends State<RestaurantTab> {
  int index = 0;

  void goNextIndex() {
    index = 1;
    setState(() {});
  }
  void backNextIndex() {
    index = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(index: index, children: [
      Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 112.h,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 280.h,
                    ),
                    Container(
                      height: 257.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFFFCE00),
                            Color(0xFFC99302),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'YOUR VICTORY IS\nCLOSER THAN\nYOU THINK',
                          textAlign: TextAlign.center,
                          style: context.typography.body2Bold.copyWith(
                            color: Colors.white,
                            fontSize: 40,
                            height: 0.9,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient:
                                const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                              Color(0xFFF74A8E),
                              Color(0xFFBC205F),
                            ]),
                            borderRadius: BorderRadius.circular(18.r)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 10),
                          child: Text('Explore', style: context.typography.body2Bold.copyWith(color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text('Restaurants', style: context.typography.body2Bold),
              ),
              SizedBox(
                height: 600,
                child: RestaurantGridView(
                  onTap: () {
                    goNextIndex();
                  },
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              Center(
                child: Image.asset(
                  'assets/images/raffle_co.png',
                  width: 151.w,
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(top: 112.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        backNextIndex();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                  const Text('Restaurants'),
                  IconButton(onPressed: () {}, icon: const SizedBox())
                ],
              ),
              const Expanded(child: RestaurantListView()),
            ],
          ),
        ),
      )
    ]);
  }
}
