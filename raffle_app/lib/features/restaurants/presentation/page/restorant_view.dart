import 'package:flutter/material.dart';
import 'package:raffle_app/features/restaurants/presentation/page/restaurant_list_view.dart';

import '../../../../core/constants/colors.dart';
import '../../../../presentation/components/custom_text.dart';
import 'restorant_tabview.dart';

class RestorantView extends StatelessWidget {
  const RestorantView({
    super.key,
    required this.tabController,
  });
  final TabController tabController;

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
        const RestaurantListView()
      ],
    );
  }
}
