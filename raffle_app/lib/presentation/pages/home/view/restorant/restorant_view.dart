import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../components/custom_text.dart';
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
                  text:
                "168 Restaurants",
              color: AppColors.chipBackColor, fontSize: 14, fontWeight: FontWeight.w400
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 18,
              bottom: 30
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
                    height: 16,
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
