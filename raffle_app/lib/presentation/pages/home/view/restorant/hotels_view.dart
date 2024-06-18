import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

class HotelsView extends StatelessWidget {
  const HotelsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                hotelHeaderWidget(title: 'Arriving', subTime: '2 Jun 2024'),
                hotelHeaderWidget(title: 'Leaving', subTime: '3 Jun 2024'),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 68.w,
                  height: 66.h,
                  decoration: BoxDecoration(
                      color: const Color(0xFFD9D9D9),
                      border: Border.all(color: const Color(0xFF797979), strokeAlign: BorderSide.strokeAlignOutside)),
                  child: Center(
                    child: Image.asset(
                      'assets/icons/ic_location.png',
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 66.h,
                    decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        border: Border.all(color: const Color(0xFF797979), strokeAlign: BorderSide.strokeAlignOutside)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 19.0),
                        child: TextField(
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Destination or Hotel',
                            hintStyle: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Helvetica'),
                            prefixIconConstraints: const BoxConstraints(minHeight: 15),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Image.asset(
                                'assets/icons/ic_search.png',
                                height: 15,
                                width: 15,
                              ),
                            ),
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded hotelHeaderWidget({required String title, required String subTime}) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        border: Border.all(
          strokeAlign: BorderSide.strokeAlignOutside,
          color: const Color(0xFF797979),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          children: [
            TitleHeading1Widget(
              text: title,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 3,
            ),
            TitleHeading1Widget(
              text: subTime,
              fontSize: 19,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    ));
  }
}
