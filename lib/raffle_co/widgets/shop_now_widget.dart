import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/auth/presentation/widgets/custom_elevated_button.dart';
import '../../shared/couple_buttons.dart';

class ShopNowWidget extends StatefulWidget {
  const ShopNowWidget({super.key});

  @override
  State<ShopNowWidget> createState() => _ShopNowWidgetState();
}

class _ShopNowWidgetState extends State<ShopNowWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: const Color(0xFFEBEBEB), borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 250.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/raffle-ec654.appspot.com/o/Apple-iPhone-15-Pro-lineup-hero-230912_Full-Bleed-Image.jpg.large.jpg?alt=media&token=2064c077-ecca-41f9-8942-198bb0f0e19c'),
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
                    const Text(
                      'Buy:USD 500',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      'Iphone',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
            CustomElevatedButton(
                isLoading: false,
                isBorderEnabled: true,
                borderRadius: 15,
                buttonColor: Colors.blue,
                textColor: Colors.white,
                onPressed: () {},
                buttonText: 'Add to Cart',
                height: 40,
                icon: null,
                width: size.width)
          ],
        ),
      ),
    );
  }
}
