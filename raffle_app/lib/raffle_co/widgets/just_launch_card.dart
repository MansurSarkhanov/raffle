import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';

class JustLaunchedCard extends StatelessWidget {
  const JustLaunchedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 31,
          spreadRadius: -2,
          color: const Color(0xFF000000).withOpacity(.25),
          offset: const Offset(0, 21),
        )
      ]),
      height: 597,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Stack(
          children: [
            Container(
              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFE82438),
                    Color(0xFFFE5377),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text('JUST LAUNCHED',
                        style: context.typography.body2Bold
                          .copyWith(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -.5),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 556,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(28), color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/im_sold.png',
                            width: 92,
                          ),
                          Image.asset(
                            'assets/images/im_total.png',
                            width: 24,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 264.h,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 31,
                                  spreadRadius: -2,
                                  color: const Color(0xFF000000).withOpacity(.25),
                                  offset: const Offset(0, 21),
                                )
                              ],
                              borderRadius: BorderRadius.circular(38),
                              image: const DecorationImage(
                                  fit: BoxFit.fill, image: AssetImage('assets/images/im_samsung.png'))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 24, top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Win',
                                  style: context.typography.body2Bold.copyWith(
                                      color: const Color(0xFFFF2738),
                                      fontSize: 44,
                                      height: 56 / 50,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.italic)),
                              Text(
                                'Samsung S24 Ultra',
                                style: context.typography.body2Bold.copyWith(
                                  fontSize: 23,
                                  letterSpacing: -.5,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 68,
                                  ),
                                  Positioned(
                                    left: 0,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFFFE600), borderRadius: BorderRadius.circular(27.5)),
                                        height: 56,
                                      width: 220,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 12.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Buy AED20',
                                              style: context.typography.body2Bold.copyWith(
                                                fontSize: 18,
                                                letterSpacing: -.5,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              'Modesh Shopping Card',
                                              style: context.typography.body2Bold.copyWith(
                                                fontSize: 10,
                                                letterSpacing: -.5,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(colors: [
                                            Color(0xFF6058F4),
                                            Color(0xFF38338E),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(34)),
                                      height: 68,
                                      width: 188,
                                      child: Center(
                                        child: Text(
                                          'Add to Cart',
                                          style: context.typography.body2Bold.copyWith(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Center(
                                child: Text(
                                  'Draw Date: 26 July, 2024 or earlier if the campaign is sold out',
                                  style:
                                      context.typography.body2Bold.copyWith(
                                    color: const Color(0xFF7C7C7C),
                                    fontSize: 11,
                                    letterSpacing: -.5,
                                  ),
                                ),
                              ),
                             
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
