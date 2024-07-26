import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SwipebleHomeCards extends StatelessWidget {
  SwipebleHomeCards({
    super.key,
  });
final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 344.h,
          child: PageView.builder(
            controller: controller,
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Container(
                  
                  height: 318.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: const Color(0xFF000000).withOpacity(.25),
                        offset: const Offset(0, 4),
                      )
                    ],
                    color: const Color(0xFFEF920F),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 36),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'BIG \nDREAM\nBIG \nPRIZE!',
                        style: context.typography.largeTitle2Bold
                            .copyWith(color: Colors.white, fontSize: 44, fontWeight: FontWeight.w900, height: 0.9),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 36.0),
            child: SmoothPageIndicator(
              effect: const ExpandingDotsEffect(
                  dotColor: Color(0xFFA4A4A4), activeDotColor: Color(0xFF424242), dotHeight: 8, dotWidth: 8),
              controller: controller,
              count: 5,
            ),
          ),
        )
      ],
    );
  }
}
