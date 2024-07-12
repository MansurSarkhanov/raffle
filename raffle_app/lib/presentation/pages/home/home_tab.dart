import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';
import 'package:raffle_app/presentation/components/gradient_text.dart';

import '../../../features/campaing/presentation/view/campaing_list.dart';
import '../../../features/product/presentation/view/product_list_view.dart';
import '../../../features/profile/presentation/widgets/contact_method.dart';
import 'widgets/swipeble_home_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final TabController controller;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   pinned: true,
        //   elevation: 0,
        //   expandedHeight: 65,
        //   toolbarHeight: 0,
        //   backgroundColor: widget.controller.index == 1 ? const Color(0xFFF9F9F9) : const Color(0xFFEBEBEB),
        //   flexibleSpace: Padding(
        //     padding: const EdgeInsets.only(top: 1.50),
        //     child: FlexibleSpaceBar(
        //       background: AppBar(
        //         backgroundColor: Colors.transparent,
        //         elevation: 0,
        //         //  toolbarHeight: size.height * 0.075,
        //         centerTitle: false,
        //         title: Consumer<ProfileNotifier>(
        //           builder: (context, notifier, child) {
        //             if (notifier.state is ProfileProgress) {
        //               return Row(
        //                 children: [
        //                   Expanded(
        //                     child: purpleContiner(
        //                       imageUrl: ImagePath.left_p.toPathSvg,
        //                       txt: 'Raffle ID',
        //                       txtTwo: '.....',
        //                     ),
        //                   ),
        //                   const SizedBox(width: 5),
        //                   Expanded(
        //                     child: GestureDetector(
        //                       child: purpleContiner(
        //                         imageUrl: ImagePath.right_p.toPathSvg,
        //                         txt: 'Wallet',
        //                         txtTwo: 'Balance: .... AZN',
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               );
        //             } else if (notifier.state is ProfileSuccess) {
        //               final user = (notifier.state as ProfileSuccess).user;
        //               return Row(
        //                 children: [
        //                   Expanded(
        //                     child: purpleContiner(
        //                       imageUrl: ImagePath.left_p.toPathSvg,
        //                       txt: 'Account ID',
        //                       txtTwo: "Raffle  ${user?.raffleId}",
        //                     ),
        //                   ),
        //                   const SizedBox(width: 5),
        //                   Expanded(
        //                     child: GestureDetector(
        //                       child: purpleContiner(
        //                         imageUrl: ImagePath.right_p.toPathSvg,
        //                         txt: 'Wallet',
        //                         txtTwo: 'Balance: ${user?.balance} AZN',
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               );
        //             }
        //             return const SizedBox.shrink();
        //           },
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const TopUpCard(),
                  const SizedBox(height: 12),
                  const SwipebleHomeCards(),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Text(
                          'FEATURED',
                          style: context.typography.body2Bold.copyWith(
                            fontSize: 29,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const ProductListView(),
                  const SizedBox(height: 31),
                  const JustLaunchedCard(),
                  const SizedBox(
                    height: 52,
                  ),
                  const JustLaunchedCard(),
                  const SizedBox(
                    height: 62,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        GradientText(
                          'Dreamers\nto WINNERS',
                          gradient: const LinearGradient(colors: [Color(0xFF264C86), Color(0xFF07224A)]),
                          style: context.typography.title3Bold
                              .copyWith(fontSize: 32, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const CampaingList(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/im_raffle_logo.png',
                        height: 45,
                        width: 45,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'raffle',
                        style: context.typography.title3Bold.copyWith(fontSize: 22, fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ContactMethod(),
                  const SizedBox(
                    height: 182,
                  )
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }

  InkWell buildSortingList(context,
      {Size? size, required VoidCallback onPressed, required String sortingText, required IconData icon}) {
    return InkWell(
      onTap: () {
        onPressed();
        Navigator.pop(context);
      },
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: size!.width * 0.02,
          ),
          Text(
            sortingText,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

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
      height: 600,
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
                            .copyWith(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white)),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 24, top: 24),
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
                          padding: const EdgeInsets.only(left: 20.0, right: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Win',
                                  style: context.typography.body2Bold.copyWith(
                                      color: const Color(0xFFFF2738),
                                      fontSize: 50,
                                      height: 56 / 50,
                                      fontWeight: FontWeight.w900,
                                      fontStyle: FontStyle.italic)),
                              Text(
                                'Samsung S24 Ultra',
                                style: context.typography.body2Bold.copyWith(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
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
                                        width: 220),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(colors: [
                                            Color(0xFF6058F4),
                                            Color(0xFF38338E),
                                          ]),
                                          borderRadius: BorderRadius.circular(34)),
                                      height: 68,
                                      width: 188,
                                    ),
                                  ),
                                  
                                ],
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Text(
                                'Draw Date: 26 July, 2024 or earlier if the campaign is sold out',
                                style:
                                    context.typography.body2Bold.copyWith(color: const Color(0xFF7C7C7C), fontSize: 10),
                              ),
                              const SizedBox(
                                height: 20,
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

class TopUpCard extends StatelessWidget {
  const TopUpCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: const Color(0xFF000000).withOpacity(.25),
              offset: const Offset(0, 4),
            )
          ],
          borderRadius: BorderRadius.circular(29),
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF07DC70),
              Color(0xFF69F70F),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Wallet Balance',
                    style: context.typography.body1Regular.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'AED100.00',
                    style: context.typography.body1Regular.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.black,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: const Color(0xFF000000).withOpacity(.25),
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 28),
                    child: Text(
                      'Top-up',
                      style: context.typography.body2Bold.copyWith(color: Colors.white, fontSize: 13),
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

Stack purpleContiner({required String imageUrl, required String txt, required txtTwo}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      SvgPicture.asset(
        imageUrl,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 6,
          ),
          TitleHeading1Widget(
            text: txt,
            textAlign: TextAlign.right,
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 0,
          ),
          SizedBox(
            width: 150,
            child: TitleHeading1Widget(
              textOverflow: TextOverflow.fade,
              text: txtTwo,
              textAlign: TextAlign.center,
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    ],
  );
}
