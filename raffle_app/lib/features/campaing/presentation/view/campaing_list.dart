import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/campaing/presentation/notifier/campaing_notifier.dart';
import 'package:raffle_app/features/campaing/presentation/notifier/campaing_state.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';

class CampaingList extends StatefulWidget {
  const CampaingList({super.key});

  @override
  State<CampaingList> createState() => _CampaingListState();
}

class _CampaingListState extends State<CampaingList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CampaingListNotifier>(
      builder: (context, notifier, child) {
        if (notifier.state is CampaingListProgress) {
          return const CircularProgressIndicator();
        } else if (notifier.state is CampaingListSuccess) {
          final campaingList = (notifier.state as CampaingListSuccess).campainglistModel;
          return Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Column(
                children: campaingList!
                    .map((e) => InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                              borderRadius: BorderRadius.circular(13.23),
                              boxShadow: [
                                    BoxShadow(
                                  color: const Color(0xFF757575).withOpacity(0.5),
                                  blurRadius: 10.29,
                                  offset: const Offset(0, 0),
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13.5),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(e.image ??
                                              'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg'))),
                                  height: 170.h,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    const Expanded(
                                      child: Divider(
                                        height: 0,
                                        color: Colors.black,
                                        thickness: 0.5,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 31,
                                    ),
                                    TitleHeading1Widget(
                                      text: 'by Ginza Group',
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    const SizedBox(
                                      width: 31,
                                    ),
                                    const Expanded(
                                      child: Divider(
                                        height: 0,
                                        color: Colors.transparent,
                                        thickness: 1,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: const Color(0xFF000000), width: 0.33),
                                            borderRadius: BorderRadius.circular(33.08)),
                                        width: 138.w,
                                        child: LinearPercentIndicator(
                                          barRadius: const Radius.circular(33.08),
                                          padding: EdgeInsets.zero,
                                          animation: false,
                                          // curve:Curves.bounceOut,
                                          animationDuration: 1500,
                                          lineHeight: 17.5,

                                          percent: (e.percent!.toDouble()) / 100,
                                          backgroundColor: const Color(0xfff1f1f1),
                                          linearGradient: e.percent! <= 25
                                              ? const LinearGradient(
                                                  colors: [
                                                    Color(0xFF23B90A),
                                                    Color(0xFF23B90A),
                                                  ],
                                                )
                                              : e.percent! > 25 && e.percent! <= 50
                                                  ? const LinearGradient(
                                                      colors: [
                                                        Color(0xFF23B90A),
                                                        Color(0xFFF8C925),
                                                      ],
                                                    )
                                                  : e.percent! > 50 && e.percent! <= 75
                                                      ? const LinearGradient(colors: [
                                                          Color(0xFF23B90A),
                                                          Color(0xFFF8C925),
                                                          Color(0xFFEA4505),
                                                        ])
                                                      : const LinearGradient(colors: [
                                                          Color(0xFFE93B00),
                                                          Color(0xFFE93B00),
                                                        ]),
                                        ),
                                      ),
                                      const Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          TitleHeading1Widget(text: '550', fontSize: 14, fontWeight: FontWeight.bold),
                                          TitleHeading1Widget(text: '/2,200 sold', fontSize: 13),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 22,
                                ),
                              ],
                              ),
                            ),
                          ),
                        ))
                  .toList()
                ..add(const InkWell(child: SizedBox(height: 10))),
            ),
          );
        }
        return const Center(child: Text('Something went wrong'));
      },
    );
  }
}
