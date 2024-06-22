import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xFFF9F9F9),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade500, blurRadius: 20, spreadRadius: 1, offset: const Offset(0, 0))
        ],
      ),
      child: TabBar(
        // onTap: (value) {
        //   print(value);
        //   if (value == 2) {
        //     return;
        //   }
        //   widget.tabController.index = value;
        // },
        splashBorderRadius: BorderRadius.circular(18),
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        controller: widget.tabController,
        labelPadding: EdgeInsets.zero,
        labelColor: const Color(0xFF505050),
        labelStyle: const TextStyle(
            fontSize: 9, color: Color(0xFF505050), fontWeight: FontWeight.w400, fontFamily: 'Helvetica'),
        tabs: [
          Tab(
            text: "Home",
            icon: widget.tabController.index == 0
                ? SvgPicture.asset(
                    'assets/svg/home_active.svg',
                    height: 20,
                    width: 21,
                  )
                : Image.asset(
                    'assets/images/im_home.png',
                    height: 20,
                    width: 20,
                  ),
          ),
          Tab(
              text: "Live",
              icon: widget.tabController.index == 1
                  ? Image.asset(
                      'assets/images/im_live_active.png',
                      height: 20,
                      width: 20,
                    )
                  : Image.asset(
                      'assets/images/im_live.png',
                      height: 20,
                      width: 20,
                    )),
          const Tab(text: "", icon: SizedBox(height: 20)),
          Tab(
              text: "Offer",
              icon: widget.tabController.index == 3
                  ? Image.asset(
                      'assets/images/im_offer_active.png',
                      height: 20,
                      width: 20,
                    )
                  : SvgPicture.asset(
                      'assets/svg/offer.svg',
                      height: 20,
                      width: 20,
                    )),
          Tab(
              text: "Inbox",
              icon: widget.tabController.index == 4
                  ? Image.asset(
                      'assets/images/im_inbox_active.png',
                      height: 20,
                      width: 20,
                    )
                  : Image.asset(
                      'assets/images/im_inbox.png',
                      height: 20,
                      width: 20,
                    )),
        ],
      ),
    );
  }
}

class RestorantBottomNavBar extends StatefulWidget {
  const RestorantBottomNavBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<RestorantBottomNavBar> createState() => _RestorantBottomNavBarState();
}

class _RestorantBottomNavBarState extends State<RestorantBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: widget.tabController.index == 1 ? const Color(0xFFF5F5F5) : const Color(0xFFF9F9F9),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade500, blurRadius: 20, spreadRadius: 1, offset: const Offset(0, 0))
        ],
      ),
      child: TabBar(
        onTap: (value) {
          widget.tabController.index = value;
          setState(() {});
        },
        splashBorderRadius: BorderRadius.circular(18),
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        controller: widget.tabController,
        labelPadding: EdgeInsets.zero,
        labelColor: const Color(0xFF505050),
        labelStyle: const TextStyle(fontSize: 9, color: Color(0xFF505050), fontWeight: FontWeight.w400),
        tabs: [
          Tab(
            text: "Restaurant",
            icon: widget.tabController.index == 0
                ? Image.asset(
                    'assets/icons/ic_restorant_active.png',
                    height: 19,
                    width: 20,
                  )
                : Image.asset(
                    'assets/icons/ic_restorant.png',
                    height: 19,
                    width: 20,
                  ),
          ),
          Tab(
              text: "Hotel",
              icon: widget.tabController.index == 1
                  ? Image.asset(
                      'assets/icons/ic_bed_active.png',
                      height: 19,
                      width: 23.87,
                    )
                  : Image.asset(
                      'assets/icons/ic_bed.png',
                      height: 19,
                      width: 23.87,
                    )),
          const Tab(
              icon: SizedBox(
            height: 19,
          )
              //  widget.tabController.index == 3
              //     ? Image.asset(
              //         'assets/icons/ic_scan.png',
              //         height: 19,
              //         width: 21,
              //       )
              //     : Image.asset(
              //         'assets/icons/ic_scan.png',
              //         height: 19,
              //         width: 20,
              //     ),
              ),
          Tab(
              text: "Shop",
              icon: widget.tabController.index == 3
                  ? Image.asset(
                      'assets/icons/ic_shop_active.png',
                      height: 19,
                      width: 20,
                    )
                  : Image.asset(
                      'assets/icons/ic_shop.png',
                      height: 19,
                      width: 20,
                    )),
          Tab(
              text: "Raffle",
              icon: widget.tabController.index == 4
                  ? Image.asset(
                      'assets/images/im_inbox_active.png',
                      height: 20,
                      width: 20,
                    )
                  : Image.asset(
                      'assets/images/im_inbox.png',
                      height: 20,
                      width: 20,
                    ))
        ],
      ),
    );
  }
}
