import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/utilities/helper/route.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:raffle_app/features/profile/presentation/page/ruffle_wallet_view.dart';
import 'package:raffle_app/injetion.dart';

import '../widgets/offer_card_widget.dart';
import '../widgets/shop_now_widget.dart';

class OfferView extends StatelessWidget {
  const OfferView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: size.height * 0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: const Text(
                'Find',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            OffersWidget(
                buttonText: 'Shop now',
                backgroundColor1: const Color(
                  0xFFBC00FF,
                ),
                buttonTextColor: const Color(0xFFA900FE),
                backgroundColor2: const Color(0xFF6F00FD),
                body: 'Buy:USD 8.40\nrafflebasic credit',
                subTitle: '29 december 2023',
                textColor: Colors.white,
                title: 'Limited time only!',
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return const ShopNowWidget();
                    },
                  );
                }),
            OffersWidget(
                buttonText: 'Top up',
                buttonTextColor: const Color(0xFFFF4F03),
                backgroundColor1: const Color(0xFFFF5B00),
                backgroundColor2: const Color(0xFFFF360A),
                body: 'Get 4 extra tickets per unit',
                subTitle: 'on AED1,000,000 Campaing',
                textColor: Colors.white,
                title: 'Top up your account',
                onPressed: () {
                  Navigator.of(context).push(RouteHelper.createRoute(
                      routeName: ChangeNotifierProvider.value(
                          value: getIt.get<ProfileNotifier>()..getUserInformation(), child: const RaffleWalletScreen()),
                      location: RoutingLocation.rightToLeft));
                }),
                
          ],
        ),
      ),
    );
  }
}
