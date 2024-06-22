import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

import '../../../core/utilities/helper/route.dart';
import 'user_cards.dart';
import 'wallet_history_page.dart';

class WalletCardPage extends StatefulWidget {
  const WalletCardPage({super.key});

  @override
  State<WalletCardPage> createState() => _WalletCardPageState();
}

class _WalletCardPageState extends State<WalletCardPage> {
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WalletAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 27.0,
        ),
        child: PageView(
          controller: controller,
          children: [
            CardPageView(
              index: 1,
              controller: controller,
              cardColorName: 'blue',
            ),
            CardPageView(
              index: 2,
              controller: controller,
              cardColorName: 'red',
            ),
            CardPageView(
              index: 0,
              controller: controller,
              cardColorName: 'green',
            ),
          ],
        ),
      ),
    );
  }
}

class CardPageView extends StatelessWidget {
  const CardPageView({
    super.key,
    required this.controller,
    required this.cardColorName,
    required this.index,
  });

  final PageController controller;
  final String cardColorName;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.5),
      child: Column(
        children: [
          UserCards(
            cardColor: cardColorName,
            onAction: () {
              controller.animateToPage(index, duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
            },
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
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
              padding: const EdgeInsets.all(24),
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
                  const SizedBox(
                    height: 16,
                  ),
                  OderActionTitle(
                    index: index,
                    title: "PEACH",
                    image: 'restorant_order',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  OderActionTitle(
                    index: index,

                    title: "PEACH",
                    image: 'restorant_order',
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  OderActionTitle(
                    index: index,

                    title: "Emiland",
                    image: 'shop_order',
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OderActionTitle extends StatelessWidget {
  const OderActionTitle({
    super.key,
    required this.image,
    required this.title,
    required this.index,
  });
  final String image;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        index == 1 ? SvgPicture.asset('assets/svg/ic_$image.svg') : SvgPicture.asset('assets/svg/ic_empty_user.svg'),
        const SizedBox(
          width: 12,
        ),
        TitleHeading1Widget(
          text: index == 1 ? title : 'Orkhan P.',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        const Spacer(),
        index == 1
            ? 
             const TitleHeading1Widget(
          text: '-36,50 \$',
          color: Color(0xFFC1272D),
          fontWeight: FontWeight.w500,
          fontSize: 16,
              )
            : const TitleHeading1Widget(
                text: '+125 \$',
                color: Color(0xFF49A600),
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
      leadingWidth: 40,
      title: Row(
        children: [
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
          SvgPicture.asset('assets/svg/ic_message.svg'),
          const SizedBox(
            width: 12,
          ),
          SvgPicture.asset('assets/svg/ic_eye.svg'),
          const SizedBox(
            width: 12,
          ),
          SvgPicture.asset('assets/svg/ic_notification.svg'),
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
