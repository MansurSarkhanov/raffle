import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';

import '../features/restaurants/presentation/page/restaurant_list_view.dart';

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

class RestaurantTab extends StatelessWidget {
  const RestaurantTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              child: Text('Categories', style: context.typography.body2Bold),
            ),
            SizedBox(
              height: 76.h,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 12),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 76.h,
                    width: 76.h,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, bottom: 12),
              child: Text('Restaurants', style: context.typography.body2Bold),
            ),
            const SizedBox(height: 500, child: RestaurantListView())
          ],
        ),
      ),
    );
  }
}
