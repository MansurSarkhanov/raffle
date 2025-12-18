import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/constants/colors.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';
import 'package:raffle_app/presentation/pages/home/scan_page.dart';

import '../../../../injetion.dart';
import '../../../../presentation/pages/home/inbox_ticket_tab.dart';
import '../../../../presentation/pages/home/view/hotel/hotels_view.dart';
import '../notifier/restourants_notifier.dart';
import 'restorant_view.dart';

class RestorantTabView extends StatefulWidget {
  const RestorantTabView({super.key, required this.restorantTabController});
  final TabController restorantTabController;

  @override
  State<RestorantTabView> createState() => _RestorantTabViewState();
}

class _RestorantTabViewState extends State<RestorantTabView> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ChangeNotifierProvider.value(
            value: getIt.get<RestourantsNotifier>()..fetchAllRestorants(context),
            child: RestorantView(tabController: widget.restorantTabController)),
        const HotelsView(),
        ScanPage(controller: widget.restorantTabController),
        Container(
          color: backColor,
        ),
        const InboxTicketTab(
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
      height: 37,
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
                border: index == 0 ? null : Border.all(width: 1, color: const Color(0xffD1D1D6)),
                color: index == 0 ? const Color(0xFF48484A) : Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9),
                child: TitleHeading1Widget(
                  text: item,
                  color: index == 0 ? Colors.white : const Color(0xFF48484A),
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
