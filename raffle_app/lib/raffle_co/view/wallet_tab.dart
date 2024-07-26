import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/notifier/app_notifier.dart';

import 'top_up/top_up_page.dart';

class WalletTab extends StatelessWidget {
  const WalletTab({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundColorCard(
          flex: 6,
          downColor: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF18852A),
              Color(0xFF18852A),
              Color(0xFF2BCE59),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 112.h,
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "WALLET",
                style: context.typography.body2Bold.copyWith(fontSize: 34, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 4),
            const WalletTopUpCard(),
            SizedBox(
              height: size.height * 0.124,
            ),
            Center(
              child: Column(
                children: [
                  SvgPicture.asset('assets/svg/ic_wallet_card.svg'),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    'It looks like you don’t have any\nsaved cards.',
                    style: context.typography.body2Bold.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class WalletTopUpCard extends StatelessWidget {
  const WalletTopUpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Wallet Balance',
                    style: context.typography.body1Regular.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'AED 0.00',
                    style: context.typography.body1Regular.copyWith(fontSize: 28, fontWeight: FontWeight.w800),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const TopUpPage();
                    },
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                      Color(0xFF6E63FC),
                      Color(0xFF292ED6),
                    ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 21),
                    child: Text(
                      'Top-up',
                      style: context.typography.body2Bold
                          .copyWith(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SwipeAppBar extends StatefulWidget {
  const SwipeAppBar({
    super.key,
  });

  @override
  State<SwipeAppBar> createState() => _SwipeAppBarState();
}

class _SwipeAppBarState extends State<SwipeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(45, 45.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 38.h,
              decoration: BoxDecoration(
                gradient: context.watch<AppNotifier>().isLeftSelected
                    ? const LinearGradient(colors: [
                        Color(0xFFF77F06),
                        Color(0xFFE5A819),
                      ])
                    : const LinearGradient(colors: [
                        Color(0xFFCE2B37),
                        Color(0xFFCE2B37),
                      ]),
                borderRadius: BorderRadius.circular(42),
              ),
            ),
            SizedBox(
              height: 60.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linearToEaseOut,
                    alignment:
                        context.watch<AppNotifier>().isLeftSelected ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      width: 130,
                      height: 44.h,
                      decoration: BoxDecoration(
                        color: context.watch<AppNotifier>().isLeftSelected
                            ? const Color(0xFFCE2B37)
                            : const Color(0xFFF58409),
                        borderRadius: BorderRadius.circular(51),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: context.watch<AppNotifier>().isLeftSelected ? 2 : 1,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Future.delayed(const Duration(microseconds: 100), () {
                              context.read<AppNotifier>().changeAppPart(context);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/im_r.png',
                                  height: 24,
                                  width: 24,
                                ),
                                if (context.watch<AppNotifier>().isLeftSelected) ...[
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    'RAFFLE\n& CO.',
                                    style: context.typography.title1Bold.copyWith(
                                        fontWeight: FontWeight.w800, fontSize: 14, color: Colors.white, height: .9),
                                  ),
                                ]
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: context.watch<AppNotifier>().isLeftSelected ? 1 : 2,
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Future.delayed(const Duration(microseconds: 100), () {
                              context.read<AppNotifier>().changeAppPart(context);
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 14.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if (!context.watch<AppNotifier>().isLeftSelected) ...[
                                  Text(
                                    'RAFFLE\nPLACE',
                                    style: context.typography.title1Bold.copyWith(
                                        fontWeight: FontWeight.w800, fontSize: 15, color: Colors.white, height: .9),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                ],
                                SvgPicture.asset('assets/svg/test.svg'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    // Container(
    //   height: 38.h,
    //   width: 180,
    //   decoration: BoxDecoration(
    //     gradient: const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
    //       Color(0xFFF77F06),
    //       Color(0xFFE5A819),
    //     ]),
    //     borderRadius: BorderRadius.circular(21),
    //   ),
    //   child: Stack(
    //     children: [
    //       AnimatedAlign(
    //         duration: const Duration(milliseconds: 300),
    //         curve: Curves.decelerate,
    //         alignment: Alignment.centerLeft,
    //         child: Container(
    //           width: 122,
    //           height: 44.h,
    //           decoration: BoxDecoration(
    //             gradient: const LinearGradient(
    //               begin: Alignment.topCenter,
    //               end: Alignment.bottomCenter,
    //               colors: [
    //                 Color(0xFF4FD675),
    //                 Color(0xFF0B560C),
    //               ],
    //             ),
    //             borderRadius: BorderRadius.circular(21),
    //           ),
    //           alignment: Alignment.center,
    //         ),
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.only(left: 18.0),
    //             child: Row(
    //               children: [
    //                 Image.asset(
    //                   'assets/images/im_raffle_logo.png',
    //                   height: 24,
    //                   width: 24,
    //                 ),
    //                 SizedBox(
    //                   width: 5.w,
    //                 ),
    //                 InkWell(
    //                   highlightColor: Colors.transparent,
    //                   splashColor: Colors.transparent,
    //                   onTap: () {},
    //                   child: Center(
    //                     child: Text(
    //                       'raffle',
    //                       style: context.typography.title1Bold
    //                           .copyWith(fontWeight: FontWeight.w800, fontSize: 15, color: Colors.white),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(right: 18.0),
    //             child: InkWell(
    //               highlightColor: Colors.transparent,
    //               splashColor: Colors.transparent,
    //               onTap: () {},
    //               child: Center(child: SvgPicture.asset('assets/svg/test.svg')),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}

class BackgroundColorCard extends StatelessWidget {
  const BackgroundColorCard({
    super.key,
    required this.gradient,
    required this.downColor,
    this.flex,
  });
  final Gradient gradient;
  final Color downColor;
  final int? flex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: flex ?? 1,
          child: AnimatedContainer(
            curve: Curves.linear,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(gradient: gradient),
          ),
        ),
        Expanded(
          child: AnimatedContainer(
            curve: Curves.linear,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(color: downColor),
          ),
        ),
      ],
    );
  }
}
