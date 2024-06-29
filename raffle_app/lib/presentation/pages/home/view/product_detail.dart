import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/constants/colors.dart';
import 'package:raffle_app/features/product/data/model/product_model.dart';

import '../../../../features/auth/presentation/widgets/custom_elevated_button.dart';
import '../../../../shared/couple_buttons.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.model});
  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: AppColors.backColor, borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 250.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(model.image.toString()),
                ),
              ),
            ),
            const SizedBox(height: 21),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Buy:USD ${model.price}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '${model.prize}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    const Text(
                      'Date: 31 October, 2023',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Color(0xFFA2A2A2), fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(17), border: Border.all(color: Colors.grey)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(11)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "rafflebasics credit",
                              style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "8.4AZN",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            CoupleButtons(
              indexFromOut: 0,
              height: size.height * 0.08,
              buttonText1: 'Prize details',
              buttonText2: 'Product details',
              function: ({required int index}) {},
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s.'),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )),
                InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: Container(
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                      child: const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          child: Icon(
                            Icons.ios_share,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            const Spacer(),

          ],
        ),
      ),
    );
  }
}
