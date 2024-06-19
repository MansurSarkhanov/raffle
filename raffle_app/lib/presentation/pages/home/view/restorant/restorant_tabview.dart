import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/constants/colors.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

import '../../inbox_ticket_tab.dart';
import 'hotels_view.dart';
import 'restorant_view.dart';

class RestorantTabView extends StatelessWidget {
  const RestorantTabView({super.key, required this.restorantTabController});
  final TabController restorantTabController;
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: restorantTabController,
      children: [
        RestorantView(tabController: restorantTabController),
        const HotelsView(),
        Container(
          color: AppColors.backColor,

        ),
        Container(
          color: AppColors.backColor,
        ),
        InboxTicketTab(
          controller: restorantTabController,
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
                child: TitleHeading1Widget(
                  text: item,
                  color: index == 0 ? Colors.white : Colors.black,
                    fontWeight: index == 0 ? FontWeight.w500 : FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
