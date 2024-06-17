import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/constants/colors.dart';

import '../../widgets/restorant_card.dart';

class RestorantTabView extends StatelessWidget {
  const RestorantTabView({super.key, required this.restorantTabController});
  final TabController restorantTabController;
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: restorantTabController,
      children: [
        RestorantView(tabController: restorantTabController),
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.blue,
        )
      ],
    );
  }
}

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

class CategoryList extends StatelessWidget {
  CategoryList({
    super.key,
  });

  final List<String> items = ["All", "Signature", "Asian", "Italian", "China", "Azerbaijan"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          var item = items[index];
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 8.w),
              decoration: BoxDecoration(
                border: index == 0 ? null : Border.all(width: 1, color: const Color(0xffBDBDBD)),
                color: index == 0 ? const Color(0xff48484a) : AppColors.chipUnselectBackColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.5),
                child: Text(
                  item,
                  style: TextStyle(
                    color: index == 0 ? AppColors.chipUnselectBackColor : AppColors.chipBackColor,
                    fontWeight: index == 0 ? FontWeight.w500 : FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
