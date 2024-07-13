import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/notifier/app_index_notifier.dart';

class CustomSelectionAppbar extends StatelessWidget {
  const CustomSelectionAppbar({
    super.key,
    // required this.controller,
  });
  // final TabController controller;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppIndexNotifier>(builder: (context, appIndexNotifier, child) {
      return Container(
        height: 110,
        decoration: const BoxDecoration(
          color: Color(0xFF9D2727),
          borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(50, 50.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 38.h,
                width: 180,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                    Color(0xFFF77F06),
                    Color(0xFFE5A819),
                  ]),
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Stack(
                  children: [
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.decelerate,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 122,
                        height: 44.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF4FD675),
                              Color(0xFF0B560C),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(21),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/im_raffle_logo.png',
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    'raffle',
                                    style: context.typography.title1Bold
                                        .copyWith(fontWeight: FontWeight.w800, fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18.0),
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {},
                            child: Center(child: SvgPicture.asset('assets/svg/test.svg')),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                  onTap: () {
                    if (ZoomDrawer.of(context)!.isOpen()) {
                      ZoomDrawer.of(context)!.close();
                    } else {
                      ZoomDrawer.of(context)!.open();
                    }

                    context.read<AppIndexNotifier>().toggleDrawer();
                  },
                  child: Container(
                    transform: Matrix4.rotationZ(0.174533),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white, width: 2)),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      );
    });
  }

 
}
