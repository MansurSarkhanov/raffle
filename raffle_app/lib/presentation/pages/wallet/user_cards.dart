import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/utilities/extension/image_path_ext.dart';
import 'package:raffle_app/notifier/app_index_notifier.dart';
import 'package:raffle_app/presentation/pages/wallet/portfolio_page.dart';

import '../../../core/constants/path/image_path.dart';
import '../../components/custom_text.dart';

class UserCards extends StatelessWidget {
  const UserCards({super.key, required this.onAction, required this.cardColor});
  final VoidCallback onAction;
  final String cardColor;
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
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: cardColor == 'red'
                    ? [
                        const Color(0xFFBEE4BA),
                        const Color(0xFF697E67),
                      ]
                    : cardColor == 'blue'
                        ? [
                            const Color(0xFFF16D5E),
                            const Color(0xFF8D4046),
                          ]
                        : [
                            const Color(0xFFA4C7DB),
                            const Color(0xFF2B80AD),
                          ],
              ),
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
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: cardColor == 'green'
                    ? [
                        const Color(0xFFF16D5E),
                        const Color(0xFF8D4046),
                      ]
                    : cardColor == 'red'
                        ? [
                            const Color(0xFFA4C7DB),
                            const Color(0xFF2B80AD),
                          ]
                        : [
                            const Color(0xFFBEE4BA),
                            const Color(0xFF697E67),
                          ],
              ),
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
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: cardColor == 'green'
                    ? [
                        const Color(0xFFBEE4BA),
                        const Color(0xFF697E67),
                      ]
                    : cardColor == 'red'
                        ? [
                            const Color(0xFFF16D5E),
                            const Color(0xFF8D4046),
                          ]
                        : [
                            const Color(0xFFA4C7DB),
                            const Color(0xFF2B80AD),
                          ],
              ),
              borderRadius: BorderRadius.circular(22),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 20, bottom: 20, right: 24),
              child: cardColor == 'red'
                  ? Row(
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
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleHeading1Widget(
                                  text: cardColor == 'green' ? 'CashBack' : "Balance",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      child: TitleHeading1Widget(
                                        text: context.watch<AppIndexNotifier>().isVisible
                                            ? "***"
                                            : cardColor == 'green'
                                                ? '199,50 '
                                                : '500',
                                        fontSize: 29,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const TitleHeading1Widget(
                                      text: '\$',
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
                        cardColor == 'green'
                            ? Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration:
                                          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 12.0),
                                        child: Center(
                                          child: TitleHeading1Widget(
                                              text: 'Withdraw', color: Colors.black, fontWeight: FontWeight.w400),
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
                                        color: const Color(0xFF40593A),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 12.0),
                                        child: Center(
                                          child: TitleHeading1Widget(
                                              text: 'Top-up', color: Colors.white, fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                          return const PortfolioPage();
                                        }));
                                      },
                                      child: Container(
                                        decoration:
                                            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
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
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF2F576C), borderRadius: BorderRadius.circular(8)),
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
                                          color: const Color(0xFF2F576C), borderRadius: BorderRadius.circular(8)),
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
        ),
      ],
    );
  }
}
