import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/features/restaurants/presentation/page/restaurant_list_view.dart';
import 'package:raffle_app/raffle_place/components/restourant_grid_view.dart';

class RafflePlacePage extends StatefulWidget {
  const RafflePlacePage({super.key, required this.controller});
  final TabController controller;

  @override
  State<RafflePlacePage> createState() => _RafflePlacePageState();
}

class _RafflePlacePageState extends State<RafflePlacePage> {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: widget.controller,
      children: [
        const RestaurantTab(),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.red,
        )
      ],
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
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: PageView(children: [
        SingleChildScrollView(
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
                            fontWeight: FontWeight.w800,
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
                padding: const EdgeInsets.only(left: 12.0, bottom: 12),
                child: Text('Restaurants', style: context.typography.body2Bold),
              ),
              SizedBox(
                height: 600,
                child: RestaurantGridView(
                  controller: controller,
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
        Padding(
          padding: const EdgeInsets.only(top: 112.0),
          child: RestaurantListView(controller: controller),
        )
      ] 
      ),
    );
  }
}
