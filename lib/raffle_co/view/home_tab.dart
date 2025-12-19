import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';
import 'package:raffle_app/presentation/components/gradient_text.dart';

import '../../features/campaing/presentation/view/campaing_list.dart';
import '../../features/product/presentation/view/product_list_view.dart';
import '../../features/profile/presentation/widgets/contact_method.dart';
import '../../l10n/app_localizations.dart';
import '../widgets/just_launch_card.dart';
import '../widgets/swipeble_home_card.dart';
import '../widgets/top_up_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({
    super.key, required this.isActive,
  });
  final bool isActive;

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF9D2727),
                    Color(0xFF9D2727),
                    Color(0xFFCE2B37),
                    Color(0xFFFFFFFF),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                    Color(0xFFEEEEEE),
                  ],
                ),
              ),
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 112.h,
                  ),
                  const TopUpCard(),
                   SwipebleHomeCards(isActive:widget.isActive ,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context)!.features,
                          style: context.typography.body2Bold.copyWith(
                            fontSize: 28,
                            height: 32 / 28,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const ProductListView(),
                  const SizedBox(height: 31),
                  const JustLaunchedCard(
                    isFirst: true,
                  ),
                  const SizedBox(
                    height: 52,
                  ),
                  const JustLaunchedCard(
                    isFirst: false,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        GradientText(
                          AppLocalizations.of(context)!.dream_winners,
                          gradient: const LinearGradient(colors: [Color(0xFF264C86), Color(0xFF07224A)]),
                          style: context.typography.title3Bold
                              .copyWith(fontSize: 32, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
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
