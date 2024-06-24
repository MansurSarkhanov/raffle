import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/campaing/presentation/notifier/campaing_notifier.dart';
import 'package:raffle_app/features/campaing/presentation/notifier/campaing_state.dart';

import '../../../auth/presentation/widgets/custom_elevated_button.dart';

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
          return Column(
              children: campaingList!
                  .map((e) => InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                  blurRadius: 14,
                                  spreadRadius: -8,
                                  offset: Offset(3, -3),
                                  )
                                ]),
                            child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: double.maxFinite,
                                    child: LinearPercentIndicator(
                                      barRadius: const Radius.circular(52),
                                      animation: false,
                                      // curve:Curves.bounceOut,
                                      animationDuration: 1500,
                                      lineHeight: 25,
                                      percent: 0.2,
                                      backgroundColor: const Color(0xfff1f1f1),
                                      progressColor: const Color.fromRGBO(
                                        208,
                                        43,
                                        59,
                                        0.70,
                                      ),
                                      center: const Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${20}',
                                            style: TextStyle(fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '/${100}',
                                            style: TextStyle(fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(29),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                            image: NetworkImage(e.image ??
                                                'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg'))),
                                    height: 240,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Buy: ${e.price}',
                                        style: const TextStyle(
                                          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                    Text(
                                      ' ${e.date}',
                                      style: const TextStyle(
                                          color: Color(0xFFA2A2A2), fontSize: 14, fontWeight: FontWeight.w500),
                                    ),
                                    ],
                                  ),
                                const SizedBox(
                                  height: 12,
                                ),
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
                                      width: double.infinity)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                .toList()
              ..add(const InkWell(child: SizedBox(height: 10))),
          );
        }
        return const Center(child: Text('Something went wrong'));
      },
    );
  }
}
