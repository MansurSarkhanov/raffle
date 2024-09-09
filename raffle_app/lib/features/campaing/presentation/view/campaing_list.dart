import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/features/campaing/presentation/notifier/campaing_notifier.dart';
import 'package:raffle_app/features/campaing/presentation/notifier/campaing_state.dart';

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
                        padding: const EdgeInsets.only(bottom: 48.0, left: 14, right: 14),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(37.r),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF000000).withOpacity(0.25),
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomCenter,
                                        colors: [Color(0xFFEBEFF2), Color(0xFFC4C8CF)]),
                                    borderRadius: BorderRadius.circular(37.r),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(e.image ??
                                            'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg'))),
                                height: 238.h,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                'CONGRATS!',
                                style: context.typography.body2Bold.copyWith(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FontStyle.italic,
                                  color: const Color(0xFFFF1D7C),
                                ),
                              ),
                              Text(
                                'Mohammad Khan on wining\nDOLLAR 10,000 Cash',
                                textAlign: TextAlign.center,
                                style: context.typography.body2Bold.copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                  color: const Color(0xFF000000),
                                ),
                              ),
                              Text(
                                'Ticket No.: DC-00139-017055841',
                                style: context.typography.body2Bold.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF000000),
                                ),
                              ),
                              Text(
                                'Announced on: Jul 2, 2024 at 12:36 PM',
                                style: context.typography.body2Bold.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF000000),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              )
                            ],
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
