import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../features/restaurants/data/model/place_model.dart';
import '../../../components/custom_text.dart';

class PlaceOfRestorantCard extends StatelessWidget {
  const PlaceOfRestorantCard({super.key, required this.places, required this.onTap});
  final Places? places;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 365.w,
      // height: 210.h,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(color: Color(0xFFE3E3E3), offset: Offset(0, 0), blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 0.w, right: 0, top: 20.h, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: onTap,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(children: [
                                SvgPicture.asset(
                                  'assets/svg/ic_save.svg',
                                ),
                                Positioned.fill(
                                  left: 6,
                                  top: 1,
                                  child: TitleHeading1Widget(
                                    text: "${places?.savedCount}",
                                    fontSize: 15.6,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ]
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 1.5.w),
                                child: SizedBox(
                                  width: 160,
                                  child: TitleHeading1Widget(
                                    text: places?.foodName ?? '',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF2D2D32),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              TitleHeading1Widget(
                                text: places?.location ?? '',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF2D2D32),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/ic_simvol.svg',
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/ic_simvol.svg',
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/ic_simvol.svg',
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/ic_simvol.svg',
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  SvgPicture.asset(
                                    'assets/svg/ic_dot.svg',
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),

                                  TitleHeading1Widget(
                                    text: 'Mediterranean , Asian',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF2D2D32),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 90.w,
                            height: 90.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    places?.imageUrl ?? "",
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              const Divider(
                thickness: 0.33,
                height: 0,
                color: Color(0xff8A8A8A),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset('assets/svg/ic_location_last.svg'),
                    const SizedBox(
                      width: 18,
                    ),
                    places?.isSaved ?? false
                        ? SvgPicture.asset('assets/svg/ic_save_filled.svg')
                        : SvgPicture.asset('assets/svg/ic_save_empty.svg'),
                    const SizedBox(
                      width: 18,
                    ),
                    places?.isFavorite ?? false
                        ? SvgPicture.asset('assets/svg/ic_favorite_red.svg')
                        : SvgPicture.asset('assets/svg/ic_favorite_empty.svg')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
