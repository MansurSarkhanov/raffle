import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/features/restaurants/data/model/restorant_model.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

class RestaurantGridCard extends StatelessWidget {
  const RestaurantGridCard({super.key, required this.restaurantModel, required this.gradient});
  final RestaurantModel restaurantModel;
  final FakeGradient gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        borderRadius: BorderRadius.circular(29),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160.h,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(29),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  restaurantModel.imageUrl ?? "",
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Center(
            child: TitleHeading1Widget(
              text: restaurantModel.name ?? '',
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF2D2D32),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleHeading1Widget(
                text: '${restaurantModel.currence}/',
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
    );
  }
}

class FakeGradient {
  final LinearGradient gradient;

  FakeGradient({required this.gradient});
}

final List<FakeGradient> gradients = [
  FakeGradient(
      gradient: const LinearGradient(colors: [
    Color(0xFFFE21AC),
    Color(0xFFFA1D33),
  ])),
  FakeGradient(
      gradient: const LinearGradient(colors: [
    Color(0xFFFFD339),
    Color(0xFFE9B502),
  ])),
  FakeGradient(
      gradient: const LinearGradient(colors: [
    Color(0xFFFE21AC),
    Color(0xFFFA1D33),
  ])),
];
