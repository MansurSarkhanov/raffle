import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/utilities/extension/image_path_ext.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

import '../../../core/constants/path/image_path.dart';

class WalletCardPage extends StatelessWidget {
  const WalletCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const WalletAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 27.0, horizontal: 12.5),
        child: Column(
          children: [
            const UserCards(),
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
                        Container(
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
                    const OderActionTitle(
                      image: 'restorant_order',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const OderActionTitle(
                      image: 'restorant_order',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const OderActionTitle(
                      image: 'shop_order',
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OderActionTitle extends StatelessWidget {
  const OderActionTitle({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/svg/ic_$image.svg'),
        const SizedBox(
          width: 12,
        ),
        const TitleHeading1Widget(
          text: 'PEACH',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        const Spacer(),
        const TitleHeading1Widget(
          text: '-36,50 \$',
          color: Color(0xFFC1272D),
          fontWeight: FontWeight.w500,
          fontSize: 16,
        )
      ],
    );
  }
}

class UserCards extends StatelessWidget {
  const UserCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22, top: 0),
          child: Container(
            width: double.infinity,
            height: 178.h,
            decoration: BoxDecoration(
              color: Colors.blue,
              gradient: const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                Color(0xFFF16D5E),
                Color(0xFF8D4046),
              ]),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 11.0, top: 20, bottom: 20, right: 24),
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
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'ID: Raffle001',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11.0, right: 11, top: 8),
          child: Container(
            width: double.infinity,
            height: 178.h,
            decoration: BoxDecoration(
              color: Colors.blue,
              gradient: const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                Color(0xFFBEE4BA),
                Color(0xFF697E67),
              ]),
              borderRadius: BorderRadius.circular(22),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            width: double.infinity,
            height: 178.h,
            decoration: BoxDecoration(
              color: Colors.blue,
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
              padding: const EdgeInsets.only(left: 24.0, top: 20, bottom: 20, right: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleHeading1Widget(
                            text: 'Balance',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TitleHeading1Widget(
                            text: '500 \$',
                            fontSize: 29,
                            fontWeight: FontWeight.w700,
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
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Center(
                              child: TitleHeading1Widget(
                                  text: 'Portfolio', color: Colors.black, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          decoration:
                              BoxDecoration(color: const Color(0xFF2F576C), borderRadius: BorderRadius.circular(8)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Center(
                              child: TitleHeading1Widget(
                                  text: 'Depozit', color: Colors.white, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          decoration:
                              BoxDecoration(color: const Color(0xFF2F576C), borderRadius: BorderRadius.circular(8)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Center(
                              child: TitleHeading1Widget(
                                  text: 'Transfer', color: Colors.white, fontWeight: FontWeight.w400),
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
        ),
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
