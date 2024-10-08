import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/utilities/extension/image_path_ext.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:raffle_app/notifier/app_notifier.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';
import 'package:raffle_app/presentation/pages/home/inbox_ticket_tab.dart';

import '../../../core/constants/path/image_path.dart';
import '../../../core/utilities/helper/route.dart';
import '../../../features/profile/presentation/widgets/support_controller.dart';
import '../../../packages/card_swiper/card_swiper.dart';
import 'portfolio_page.dart';
import 'wallet_history_page.dart';

class WalletCardPage extends StatefulWidget {
  const WalletCardPage({super.key});
  @override
  State<WalletCardPage> createState() => _WalletCardPageState();
}

class _WalletCardPageState extends State<WalletCardPage> {
  final CardSwiperController cardController = CardSwiperController();
  List<Widget> cards = [
    const TestCardBlue(),
    const TestCardGreen(),
    const TestCardRed(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: const WalletAppBar(
      // ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () async {
          return await context.read<ProfileNotifier>().getUserInformation();
        },
        child: Column(
          children: [
            const SizedBox(
              height: 112,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: SizedBox(
                height: 220,
                child: Swiper(
                  onIndexChanged: (value) {
                    context.read<AppNotifier>().changeCurrentCardIndex(value);
                  },
                  axisDirection: AxisDirection.right,
                  scrollDirection: Axis.horizontal,
                  itemCount: cards.length,
                  itemWidth: 400,
                  itemHeight: 200,
                  layout: SwiperLayout.STACK,
                  itemBuilder: (context, index) {
                    return cards[index];
                  },
                ),
              ),
            ),
            const WalletExpenseListCard(index: 0),
            const SizedBox(
              height: 48,
            )
          ],
        ),
      ),
    );
  }
}

class WalletExpenseListCard extends StatelessWidget {
  const WalletExpenseListCard({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 203, 200, 200),
              blurRadius: 20,
              spreadRadius: 2,
              offset: Offset(0, 0),
            )
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:24,right: 24,top: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TitleHeading1Widget(
                      text: 'Последние операции',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(RouteHelper.createRoute(
                            routeName: const WalletHistoryPage(), location: RoutingLocation.rightToLeft));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFFD9D9D9), borderRadius: BorderRadius.all(Radius.circular(9))),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 9),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TitleHeading1Widget(
                                  text: 'Все', fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const Row(
                  children: [
                    TitleHeading1Widget(
                      text: '1 Июнь 2024',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ],
                ),
              index==0 ? Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    OderActionTitle(
                      index: index,
                      money: '-36,50 \$',
                      title: "PEACH",
                      image: 'wallet_restorant',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    OderActionTitle(
                      index: index,
                      money: '-36,50 \$',
                      title: "PEACH",
                      image: 'wallet_restorant',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    OderActionTitle(
                      index: index,
                      money: '-36,50 \$',
                      title: "Emiland",
                      image: 'wallet_shop',
                    ), const SizedBox(
                      height: 32,
                    ),


                  ],
                ):
           index==1?   Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  OderActionTitle(
                    index: index,
                    money: '+125 \$',
                    title: "PEACH",
                    image: 'wallet_restorant',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  OderActionTitle(
                    index: index,
                    money: '+125 \$',
                    title: "NOVIKOV CAFE",
                    image: 'wallet_restorant',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  OderActionTitle(
                    index: index,
                    money: '+40 \$',

                    title: "Emiland",
                    image: 'wallet_shop',
                  ), const SizedBox(
                    height: 32,
                  ),
                  OderActionTitle(
                    index: index,
                    money: '+125 \$',

                    title: "NOVIKOV CAFE",
                    image: 'wallet_restorant',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ):
              Column(
             children: [
               const SizedBox(
                 height: 16,
               ),
               OderActionTitle(
                 index: index,
                 money: '+125 \$',

                 title: "Emil H.",
                 image: 'empty_user',
               ),
               const SizedBox(
                 height: 32,
               ),
               OderActionTitle(
                 index: index,
                 money: '+125 \$',
                 title: "Orkhan P.",
                 image: 'empty_user',

               ),
               const SizedBox(
                 height: 32,
               ),
               OderActionTitle(
                 index: index,
                 money: '+125 \$',

                 title: "Kamran M.",
                 image: 'empty_user',

               ), const SizedBox(
                 height: 32,
               ),

             ],
           )
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TestCardGreen extends StatelessWidget {
  const TestCardGreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 14, right: 14),
      child: Container(
        width: double.infinity,
        height: 178.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
            Color(0xFFBEE4BA),
            Color(0xFF697E67),
          ]),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 23.0, top: 23, bottom: 23, right: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleHeading1Widget(
                        text: 'CashBack',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: [
                          TitleHeading1Widget(
                            text: context.watch<AppNotifier>().isVisible ? "****\$" : '199,50\$',
                            fontSize: 29,
                            fontWeight: FontWeight.w700,
                          ),
                       
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40, width: 40, child: Image.asset(ImagePath.raffle_logo.toPathPng)),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 16.54,
                            offset: const Offset(0, 1.32),
                            color: const Color(0xFF000000).withOpacity(0.25))
                      ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.5),
                        child: Center(
                          child: TitleHeading1Widget(
                            text: 'Withdraw',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 16.54,
                              offset: const Offset(0, 1.32),
                              color: const Color(0xFF000000).withOpacity(0.25))
                        ],
                        color: const Color(0xFF40593A),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.5),
                        child: Center(
                          child: TitleHeading1Widget(
                            text: 'Top-up',
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
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
      ),
    );
  }
}

class TestCardRed extends StatelessWidget {
  const TestCardRed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 14, right: 14),
      child: Container(
        width: double.infinity,
        height: 178.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
            Color(0xFFF16D5E),
            Color(0xFF8D4046),
          ]),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 23.0, top: 23, bottom: 23, right: 23),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/im_card_qr.png',
                  height: 120,
                  width: 120,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 40, width: 40, child: Image.asset(ImagePath.raffle_logo.toPathPng)),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                blurRadius: 16.54,
                                offset: const Offset(0, 1.32),
                                color: const Color(0xFF000000).withOpacity(0.25))
                          ], color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.only(top:12,bottom: 11,left:8,right: 8),
                            child: TitleHeading1Widget(
                              text: 'ID: Raffle001',
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    const    SizedBox(width: 20,),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                blurRadius: 16.54,
                                offset: const Offset(0, 1.32),
                                color: const Color(0xFF000000).withOpacity(0.25))
                          ],
                              borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(top:11,bottom: 11,left:8,right: 8),
                            child: TitleHeading1Widget(
                              text: 'ID: I',
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}

class TestCardBlue extends StatelessWidget {
  const TestCardBlue({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 14, right: 14),
      child: Container(
        width: double.infinity,
        height: 178.h,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFA4C7DB),
              Color(0xFF2B80AD),
            ],
          ),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 23.0, top: 23, bottom: 23, right: 23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleHeading1Widget(
                        text: "Balance",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Row(
                        children: [
                          TitleHeading1Widget(
                            text: context.watch<AppNotifier>().isVisible ? "****\$" : '500\$',
                            fontSize: 29,
                            fontWeight: FontWeight.w700,
                          ),
                          
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40, width: 40, child: Image.asset(ImagePath.raffle_logo.toPathPng)),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(RouteHelper.createRoute(
                            routeName: const PortfolioPage(), location: RoutingLocation.rightToLeft));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 16,
                                offset: const Offset(0, 1),
                                color: const Color(0xFF000000).withOpacity(0.25))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 11),
                          child: Center(
                            child: TitleHeading1Widget(
                              text: 'Portfolio',
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                          color: const Color(0xFF000000).withOpacity(0.25),
                        )
                      ], color: const Color(0xFF2F576C), borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 11),
                        child: Center(
                          child: TitleHeading1Widget(
                            text: 'Depozit',
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF2F576C),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              offset: const Offset(0, 4),
                              color: const Color(0xFF000000).withOpacity(0.25),
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 11),
                        child: Center(
                          child: TitleHeading1Widget(
                            text: 'Transfer',
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
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
      ),
    );
  }
}

class OderActionTitle extends StatelessWidget {
  const OderActionTitle({
    super.key,
    required this.image,
    required this.title, required this.money, required this.index,
  });
  final String image;
  final String title;
  final String money;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/svg/ic_$image.svg') ,
        const SizedBox(
          width: 12,
        ),
        TitleHeading1Widget(
          text: title ,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        const Spacer(),

             TitleHeading1Widget(
          text: money,
          color: index == 0 ? const Color(0xFFC1272D) : const Color(0xFF49A600),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )

      ],
    );
  }
}

class WalletAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WalletAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_rounded),
          ),
          const SizedBox(
            width: 8,
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(context.watch<ProfileNotifier>().user?.image ?? ''),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleHeading1Widget(
                text: 'Xoş gördük, ${context.watch<ProfileNotifier>().user?.name}',
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              const TitleHeading1Widget(
                text: 'Raffle tətbiqində xoş gördük',
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ],
          ),
          const Spacer(),
          InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                SupportController.openWhatsapp(context: context, text: 'Salam', number: '+994776359777');
              },
              child: SvgPicture.asset('assets/svg/ic_message.svg')),
          const SizedBox(
            width: 12,
          ),
          InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                // context.read<AppIndexNotifier>().visibleBalance();
              },
              child: SvgPicture.asset(
                  context.watch<AppNotifier>().isVisible
                  ? 'assets/svg/ic_unvisible.svg'
                  : 'assets/svg/ic_eye.svg')),
          const SizedBox(
            width: 12,
          ),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: SvgPicture.asset('assets/svg/ic_notification.svg'),
            onTap: () {
              Navigator.of(context).push(RouteHelper.createRoute(
                  routeName: const Scaffold(
                    body: InboxTicketTab(),
                  ),
                  location: RoutingLocation.rightToLeft));
            },
          ),
          const SizedBox(
            width: 12,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
