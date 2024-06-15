import 'package:flutter/material.dart';

import '../widgets/offer_card_widget.dart';

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
                  // openCupertinoBottomSheet(
                  //     builder: (context) {
                  //       return const ShopNowScreen(
                  //         drawDate: '10 Decmeber 2023',
                  //         totalNumber: 2,
                  //         category: 1,
                  //         prodId: '98765',
                  //         whatYouWillWin: 'Fiat 500',
                  //         imageUrl: [
                  //           'https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80'
                  //         ],
                  //         prizeName: ' Fiat 500 La Prima',
                  //         littleImageUrl: [null],
                  //         addMore: true,
                  //         youWillBuy: ' Ruffle credit USD 105',
                  //         prizeDetail:
                  //             'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
                  //         productDetail:
                  //             'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
                  //         soldNumber: 10,
                  //         date: '1',
                  //         whatWillYouWin: 'a',
                  //       );
                  //     },
                  //     args: const CupertinoBottomSheetRouteArgs(
                  //         swipeSettings: SwipeSettings(
                  //       canCloseBySwipe: true,
                  //       velocityThreshhold: 200,
                  //     )));
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
                  // Navigator.of(context).pushNamed(RaffleWalletScreen.routeName);
                }),
                
          ],
        ),
      ),
    );
  }
}

// final GlobalKey _repaintBoundaryKey = GlobalKey();

// /// can be used to simplify bottom sheet opening without the need for context
// final GlobalKey<NavigatorState> cupertinoBottomSheetNavigatorKey = GlobalKey();

// Future openCupertinoBottomSheet({
//   required Widget Function(BuildContext context) builder,
//   CupertinoBottomSheetRouteArgs? args,
// }) async {
//   if (cupertinoBottomSheetNavigatorKey.currentState == null) {
//     throw '''
//       No navigator state has been found. Add cupertinoBottomSheetNavigatorKey as a 
//       navigatorKey argument of your App initialization
//       example: 
//       @override
//       Widget build(BuildContext context) {
//         return CupertinoBottomSheetRepaintBoundary(
//           child: MaterialApp(
//             navigatorKey: cupertinoBottomSheetNavigatorKey,
//             title: 'Flutter Cupertino Bottom Sheet',
//             theme: ThemeData(
//               primarySwatch: Colors.red,
//             ),
//             home: const TestPage(),
//           ),
//         );
//       }
//     ''';
//   }
//   return cupertinoBottomSheetNavigatorKey.currentState!.push(
//     CupertinoBottomSheetRoute(
//       args: args ??
//           const CupertinoBottomSheetRouteArgs(
//             swipeSettings: SwipeSettings(
//               canCloseBySwipe: true,
//             ),
//           ),
//       builder: builder,
//     ),
//   );
// }