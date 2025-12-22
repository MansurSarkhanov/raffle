import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';

import '../../features/campaing/presentation/view/campaing_list.dart';
import '../../l10n/app_localizations.dart';
import '../../presentation/pages/home/view/watch_live_view.dart';
import '../widgets/swipeble_home_card.dart';

class DrawsTab extends StatefulWidget {
  const DrawsTab({super.key});

  @override
  State<DrawsTab> createState() => _DrawsTabState();
}

class _DrawsTabState extends State<DrawsTab> {
  final PageController controller = PageController(viewportFraction: 0.7);
  late List<VideoItem> videoItems;

  bool isLeftSelected = true;

  @override
  void initState() {
    super.initState();
   videoItems = [
     VideoItem('https://firebasestorage.googleapis.com/v0/b/raffle-ec654.appspot.com/o/11%20September%20Winners.mp4?alt=media&token=a48e6788-4c02-4bc8-a9b4-45ab7f53bc4f'),
     VideoItem('https://firebasestorage.googleapis.com/v0/b/raffle-ec654.appspot.com/o/IMG_3711.MP4?alt=media&token=4332f612-59e6-4df6-9046-4aec94f54314'),
     // VideoItem('https://firebasestorage.googleapis.com/v0/b/raffle-ec654.appspot.com/o/11%20September%20Winners.mp4?alt=media&token=a48e6788-4c02-4bc8-a9b4-45ab7f53bc4f',aspectRatio: 1.5),
     // VideoItem('https://firebasestorage.googleapis.com/v0/b/raffle-ec654.appspot.com/o/11%20September%20Winners.mp4?alt=media&token=a48e6788-4c02-4bc8-a9b4-45ab7f53bc4f',aspectRatio: 1.5),
      // VideoItem('https://firebasestorage.googleapis.com/v0/b/raffle-ec654.appspot.com/o/11%20September%202025.mp4?alt=media&token=f31b9f41-6619-4c94-9b2d-177f2886deb0'),
      // VideoItem('https://firebasestorage.googleapis.com/v0/b/raffle-ec654.appspot.com/o/11%20September%202025.mp4?alt=media&token=f31b9f41-6619-4c94-9b2d-177f2886deb0'),
      // VideoItem('https://firebasestorage.googleapis.com/v0/b/raffle-ec654.appspot.com/o/11%20September%202025.mp4?alt=media&token=f31b9f41-6619-4c94-9b2d-177f2886deb0'),
      // VideoItem('https://firebasestorage.googleapis.com/v0/b/raffle-ec654.appspot.com/o/11%20September%202025.mp4?alt=media&token=f31b9f41-6619-4c94-9b2d-177f2886deb0'),
    ];
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF08294F),
                    Color(0xFF08294F),
                    Color(0xFF4370E5),
                    Color(0xFFFFFFFF),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                  ],
                ),
              ),
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 112.h,
                  ),
                  SizedBox(
                    height: 380.h,
                    child: PageView.builder(
                      padEnds: false,
                      controller: controller,
                      itemCount: videoItems.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>  WatchLiveScreen(
                                    videoUrl: videoItems[index].url,
                                    date: '17 June 2023',
                                    time: '10:00 AM'),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 6, top: 12, bottom: 12, left: 12),
                            child: Image.asset('assets/images/im_draw_test.png'),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(42),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 52.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD6D6D6),
                            borderRadius: BorderRadius.circular(42),
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              AnimatedAlign(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linearToEaseOut,
                                alignment: isLeftSelected ? Alignment.centerLeft : Alignment.centerRight,
                                child: Container(
                                  width: 182.w,
                                  height: 60.h,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFFFFE201),
                                        Color(0xFFFFD900),
                                      ],
                                    ),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(51),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        Future.delayed(const Duration(microseconds: 100), () {
                                          isLeftSelected = true;
                                          setState(() {});
                                        });
                                        // controller.animateToPage(0,
                                        //     duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                                      },
                                      child: Center(
                                        child: Text(AppLocalizations.of(context)!.active_ticket,
                                            style: context.typography.headlineBold.copyWith(
                                                fontWeight: isLeftSelected ? FontWeight.w800 : FontWeight.w600,
                                                letterSpacing: -.5,
                                                fontSize: 18.sp)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        Future.delayed(const Duration(microseconds: 100), () {
                                          isLeftSelected = false;
                                          setState(() {});
                                        });
                                        // controller.animateToPage(1,
                                        //     duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                                      },
                                      child: Center(
                                        child: Text(
                                          AppLocalizations.of(context)!.expired_ticket,
                                          style: context.typography.headlineBold.copyWith(
                                              letterSpacing: -.5,
                                              fontWeight: isLeftSelected ? FontWeight.w600 : FontWeight.w800,
                                              fontSize: 18.sp),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const CampaingList(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 182,
                  )
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
