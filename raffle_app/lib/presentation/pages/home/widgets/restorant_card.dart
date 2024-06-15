import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:raffle_app/presentation/pages/home/view/restorant/restorant_detail_view.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.restaurant});
  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const RestorantDetailView();
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
                color: Color(0xFF757575),
                offset: Offset(-2, 2),
                blurRadius: 14,
                spreadRadius: -10,
              ),
              BoxShadow(
                color: Color(0xFF757575),
                offset: Offset(2, -2),
                blurRadius: 14,
                spreadRadius: -10,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 17.w, height: 20.h, child: SvgPicture.asset('assets/svg/ic_save.svg')),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 1.5.w),
                            child: Text(
                              restaurant.name,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 86,
                        height: 86,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                restaurant.logo,
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
                SizedBox(height: 21.h),
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
                      SizedBox(
                        width: 140.w,
                        child: LinearPercentIndicator(
                          linearGradient: restaurant.gradient,
                          padding: EdgeInsets.only(left: 5.w),
                          barRadius: Radius.circular(52.r),
                          animation: false,
                          animationDuration: 1500,
                          lineHeight: 18.h,
                          percent: restaurant.sold / restaurant.target,
                          backgroundColor: const Color(0xfff1f1f1),
                          // progressColor: restaurant.color,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${restaurant.sold}/',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('${restaurant.target} sold', style: const TextStyle())
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

class RestaurantModel {
  final String name;
  final int sold;
  final int target;
  final Color color;
  final LinearGradient gradient;
  final String logo;

  RestaurantModel({
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

final List<RestaurantModel> restaurants = [
  RestaurantModel(
    name: 'Restaurants by\nEmin Agalarov',
    logo: 'assets/demo/r.png',
    sold: 8400,
    target: 12000,
    color: const Color.fromRGBO(253, 32, 138, 1),
  ),
  RestaurantModel(
      name: 'M A T A',
      logo: 'assets/demo/novikov.png',
      sold: 6000,
      target: 14000,
      color: const Color(0xffe9b602),
      gradient: const LinearGradient(colors: [
        Color(0xffe9b602),
        Color(0xffe9b602),
      ])),
  RestaurantModel(
    name: 'PINSKIY & CO',
    logo: 'assets/demo/m.png',
    sold: 8400,
    target: 12000,
    color: const Color.fromRGBO(253, 32, 138, 1),
  ),
  RestaurantModel(
    name: 'PINSKIY & CO',
    logo: 'assets/demo/m.png',
    sold: 8400,
    target: 12000,
    color: const Color.fromRGBO(253, 32, 138, 1),
  ),
];
