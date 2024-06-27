import 'package:flutter/material.dart';
import 'package:raffle_app/features/restaurants/presentation/page/place_of_restaurants_list.dart';
import 'package:raffle_app/features/restaurants/presentation/page/restaurant_list_view.dart';

import '../../../../core/constants/colors.dart';
import '../../../../presentation/components/custom_text.dart';
import 'restorant_tabview.dart';

final navigationKey = GlobalKey<NavigatorState>();

class RestorantView extends StatelessWidget {
  RestorantView({
    super.key,
    required this.tabController,
  });
  final TabController tabController;
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        CategoryList(),
        const SizedBox(
          height: 18,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              TitleHeading1Widget(
                  text: "168 Restaurants", color: AppColors.chipBackColor, fontSize: 14, fontWeight: FontWeight.w400),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              RestaurantListView(controller: pageController),
              const PlaceOfRestaurantsList(),
            ],
          ),
        )
      ],
    );
  }
}
