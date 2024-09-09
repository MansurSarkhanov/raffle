import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/notifier/app_notifier.dart';

class CustomSelectionAppbar extends StatefulWidget {
  const CustomSelectionAppbar({
    super.key,
  });

  @override
  State<CustomSelectionAppbar> createState() => _CustomSelectionAppbarState();
}

class _CustomSelectionAppbarState extends State<CustomSelectionAppbar> {
  bool isLeftSelected = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(builder: (context, appIndexNotifier, child) {
      return Container(
        height: 130,
        decoration: BoxDecoration(
          color: context.watch<AppNotifier>().currentPageIndex == 0 ? const Color(0xFF9D2727) : const Color(0xFF147923),
          borderRadius: const BorderRadius.vertical(bottom: Radius.elliptical(45, 45.0)),
        ),
        child: Padding(
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
                              child: Text('Active Tickets',
                                  style: context.typography.headlineBold.copyWith(
                                      fontWeight: isLeftSelected ? FontWeight.w800 : FontWeight.w600, fontSize: 18.sp)),
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
                                'Expired Tickets',
                                style: context.typography.headlineBold.copyWith(
                                    fontWeight: isLeftSelected ? FontWeight.w600 : FontWeight.w800, fontSize: 18.sp),
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

        //  Padding(
        //   padding: const EdgeInsets.only(top: 50.0, left: 24, right: 24, bottom: 12),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //         height: 38.h,
        //         width: 180,
        //         decoration: BoxDecoration(
        //           gradient: const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
        //             Color(0xFFF77F06),
        //             Color(0xFFE5A819),
        //           ]),
        //           borderRadius: BorderRadius.circular(21),
        //         ),
        //         child: Stack(
        //           children: [
        //             AnimatedAlign(
        //               duration: const Duration(milliseconds: 300),
        //               curve: Curves.decelerate,
        //               alignment: Alignment.centerLeft,
        //               child: Container(
        //                 width: 122,
        //                 height: 44.h,
        //                 decoration: BoxDecoration(
        //                   gradient: const LinearGradient(
        //                     begin: Alignment.topCenter,
        //                     end: Alignment.bottomCenter,
        //                     colors: [
        //                       Color(0xFF4FD675),
        //                       Color(0xFF0B560C),
        //                     ],
        //                   ),
        //                   borderRadius: BorderRadius.circular(21),
        //                 ),
        //                 alignment: Alignment.center,
        //               ),
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Padding(
        //                   padding: const EdgeInsets.only(left: 18.0),
        //                   child: Row(
        //                     children: [
        //                       Image.asset(
        //                         'assets/images/im_raffle_logo.png',
        //                         height: 24,
        //                         width: 24,
        //                       ),
        //                       SizedBox(
        //                         width: 5.w,
        //                       ),
        //                       InkWell(
        //                         highlightColor: Colors.transparent,
        //                         splashColor: Colors.transparent,
        //                         onTap: () {},
        //                         child: Center(
        //                           child: Text(
        //                             'raffle',
        //                             style: context.typography.title1Bold
        //                                 .copyWith(fontWeight: FontWeight.w800, fontSize: 15, color: Colors.white),
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //                 Padding(
        //                   padding: const EdgeInsets.only(right: 18.0),
        //                   child: InkWell(
        //                     highlightColor: Colors.transparent,
        //                     splashColor: Colors.transparent,
        //                     onTap: () {},
        //                     child: Center(child: SvgPicture.asset('assets/svg/test.svg')),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //       InkWell(
        //           onTap: () {
        //             if (ZoomDrawer.of(context)!.isOpen()) {
        //               ZoomDrawer.of(context)!.close();
        //             } else {
        //               ZoomDrawer.of(context)!.open();
        //             }

        //             context.read<AppNotifier>().toggleDrawer();
        //           },
        //           child: Container(
        //             transform: Matrix4.rotationZ(0.174533),
        //             decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white, width: 2)),
        //             child: const Padding(
        //               padding: EdgeInsets.all(12.0),
        //               child: Icon(
        //                 Icons.person,
        //                 color: Colors.white,
        //               ),
        //             ),
        //           )),
        //     ],
        //   ),
        // ),
      );
    });
  }
}
