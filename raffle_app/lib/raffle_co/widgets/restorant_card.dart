import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raffle_app/features/restaurants/data/model/restorant_model.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';
import 'package:raffle_app/raffle_place/components/restorant_grid_card.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.restaurantModel, required this.gradient});
  final RestaurantModel restaurantModel;
  final FakeGradient gradient;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SizedBox(
        width: 365.w,
        // height: 210.h,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: const LinearGradient(
                begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.white, Color(0xFFBABABA)]),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.25), offset: const Offset(0, 1), blurRadius: 4, spreadRadius: 0),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          SvgPicture.asset(
                            'assets/svg/ic_save.svg',
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 1.5.w),
                            child: TitleHeading1Widget(
                              text: restaurantModel.name ?? '',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF2D2D32),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 1.5.w),
                            child: TitleHeading1Widget(
                              text: 'Moscow',
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF2D2D32),
                            ),
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
                              restaurantModel.imageUrl ?? "",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
                SizedBox(height: 24.h),
                const Divider(
                  thickness: 0.33,
                  height: 0,
                  color: Color(0xff8A8A8A),
                ),
                SizedBox(height: 21.h),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 22.w),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Stack(
                //         alignment: Alignment.centerLeft,
                //         children: [
                //           InnerShadow(
                //             blur: 3,
                //             offset: const Offset(0, 0.5),
                //             child: Container(
                //               height: 18.h,
                //               width: 140,
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(10), color: const Color(0xFFE0E0E0)),
                //             ),
                //           ),
                //           SizedBox(
                //             width: 140, // 200.0 is the total width of the progress bar

                //             child: InnerShadow(
                //               blur: 3,
                //               offset: const Offset(0, 0.5),
                //               child: LinearPercentIndicator(
                //                 linearGradient: gradient.gradient,
                //                 padding: const EdgeInsets.only(left: 0),
                //                 barRadius: Radius.circular(52.r),
                //                 animation: false,
                //                 animationDuration: 1500,
                //                 lineHeight: 18.h,
                //                 backgroundColor: Colors.transparent,
                //                 percent: restaurantModel.percent!.toDouble() / 100,
                //                 // backgroundColor: const Color(0xFFE0E0E0),
                //                 // progressColor: restaurant.color,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           TitleHeading1Widget(
                //             text: '${restaurantModel.currence}/',
                //             fontWeight: FontWeight.bold,
                //             fontSize: 12.sp,
                //           ),
                //           TitleHeading1Widget(
                //             text: '${restaurantModel.total} sold',
                //             fontSize: 12.sp,
                //             fontWeight: FontWeight.w400,
                //           )
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

