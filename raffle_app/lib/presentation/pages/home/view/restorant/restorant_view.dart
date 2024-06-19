import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../widgets/restorant_card.dart';
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
          height: 6,
        ),
        CategoryList(),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              Text(
                "168 Restaurants",
                style: TextStyle(color: AppColors.chipBackColor, fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 10,
            ),
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final items = restaurants;
              return Column(
                children: [
                  RestaurantCard(
                    tabController: tabController,
                    restaurant: items[index],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
