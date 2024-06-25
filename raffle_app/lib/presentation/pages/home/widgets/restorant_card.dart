import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:raffle_app/features/restaurants/data/model/restorant_model.dart';
import 'package:raffle_app/features/restaurants/presentation/page/restorant_detail_view.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.restaurantModel});
  final RestaurantModel restaurantModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const RestorantDetailView(
            );
          },
        ));
      },
      child: SizedBox(
        width: 365.w,
        // height: 210.h,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFE3E3E3),
                offset: Offset(0, 0),
                blurRadius: 5, spreadRadius: 2
              ),
            
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
                            child: SizedBox(
                              width: 160,
                              child: TitleHeading1Widget(
                                text: restaurantModel.name ?? '',
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF2D2D32),
                              ),
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
                              )),
                          // border: Border.all(
                          //   width: 0.4,
                          //   color: Colors.black,
                          // ),
                        ),
                        // child: Image.asset(
                        //   fit: BoxFit.cover,
                        //   restaurant.logo,
                        //   width: 86,
                        //   height: 86,
                        // ),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 140, // 200.0 is the total width of the progress bar

                            child: LinearPercentIndicator(
                              linearGradient: const LinearGradient(
                                colors: [Color(0xFFFE21AC), Color(0xFFFA1D33)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              padding: EdgeInsets.only(left: 5.w),
                              barRadius: Radius.circular(52.r),
                              animation: false,
                              animationDuration: 1500,
                              lineHeight: 18.h,
                              percent: restaurantModel.percent!.toDouble() / 100,
                              backgroundColor: const Color(0xFFE0E0E0),
                              // progressColor: restaurant.color,
                            ),
                          ),
                        
                          Container(
                            height: 18.h,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFFE0E0E0).withOpacity(0.08),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TitleHeading1Widget(
                            text:
                            '${restaurantModel.currence}/',
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                          TitleHeading1Widget(
                            text: '${restaurantModel.total} sold',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RestaurantModelFake {
  final String name;
  final int sold;
  final int target;
  final Color color;
  final LinearGradient gradient;
  final String logo;

  RestaurantModelFake({
    required this.name,
    required this.logo,
    required this.sold,
    required this.target,
    required this.color,
    this.gradient = const LinearGradient(
      colors: [Color(0xFFFE21AC), Color(0xFFFA1D33)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  });
}

final List<RestaurantModelFake> restaurants = [
  RestaurantModelFake(
    name: 'Restaurants by\nEmin Agalarov',
    logo: 'assets/images/im_agalarova_last.png',
    sold: 8400,
    target: 12000,
    color: const Color.fromRGBO(253, 32, 138, 1),
  ),
  RestaurantModelFake(
      name: 'Navikov Group',
      logo: 'assets/images/im_novikov_last.png',

      sold: 6000,
      target: 14000,
      color: const Color(0xffe9b602),
      gradient: const LinearGradient(colors: [
        Color(0xffe9b602),
        Color(0xffe9b602),
      ])),
  RestaurantModelFake(
    name: 'MATA',
    logo: 'assets/images/im_mata_last.png',

    sold: 8400,
    target: 12000,
    color: const Color.fromRGBO(253, 32, 138, 1),
  ),
  RestaurantModelFake(
    name: 'MATA',
    logo: 'assets/images/im_mata_last.png',
    sold: 8400,
    target: 12000,
    color: const Color.fromRGBO(253, 32, 138, 1),
  ),
];
