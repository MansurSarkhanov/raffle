import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_notifier.dart';

import '../../../../presentation/components/go_back_button.dart';

class RaffleWalletScreen extends StatefulWidget {
  static String routeName = '/rafflewalletscreen';
  const RaffleWalletScreen({super.key});

  @override
  State<RaffleWalletScreen> createState() => _RaffleWalletScreenState();
}

class _RaffleWalletScreenState extends State<RaffleWalletScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          color: const Color(0xFFF1F1F1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.08),
            child: Column(children: [
              Row(
                children: [
                  GoBackButton(
                    onPressed: () {
                      // Get.offAll(
                      //     transition: Transition.leftToRight,
                      //     duration: const Duration(milliseconds: 60),
                      //         (

                      //         ) =>   ApplicationSelectionScreen());
                      Navigator.pop(context);
                    },
                    buttonBackColor: const Color(0xFFD9D9D9),
                  ),
                  const Spacer(),
                  const Text(
                    'Raffle Wallet',
                    style: TextStyle(
                      color: Color(0xFF252525),
                      fontSize: 24,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  // if (num.parse(authController.balance ?? '0') <
                  //     cartController.totalPrice.value) {
                  //   showToast(
                  //       msg: 'balansda kifayət qədər məbləğ yoxdur!',
                  //       backgroundColor: Colors.red,
                  //       textColor: Colors.white);
                  // } else {
                  //   final formattedTime =
                  //       DateFormat('yMMMd').format(DateTime.now());

                  //   buyTicketController.buyTickets(
                  //       userId: authController.uid.toString(),
                  //       tickets: cartController.cartElements.map((e) {
                  //         List<String> randomTicketIds = [];
                  //         for (int i = 0; i < e.numberOfOrder; i++) {
                  //           String randomId = nanoid(length: 7);
                  //           randomTicketIds.add(randomId);
                  //         }

                  //         return TicketModel(
                  //                 productId: e.productId,
                  //                 imageUrl: productController
                  //                     .productElements[productController
                  //                         .productElements
                  //                         .indexWhere((element) =>
                  //                             element.productId == e.productId)]
                  //                     .imageUrl[0],
                  //                 numberOfTickets: e.numberOfOrder,
                  //                 category: e.category,
                  //                 drawDate: e.drawDate,
                  //                 issuedOn: formattedTime,
                  //                 name: authController.username,
                  //                 prize: e.prize,
                  //                 ticketIds: randomTicketIds,
                  //                 youWillBuy: e.whatYouWillBuy.toString())
                  //             .toJson();
                  //       }).toList());

                  //   cartController.emptyCartAfterPurchase();

                  //   authController.updateBalance(
                  //       price: cartController.totalPrice.value);
                  // }
                },
                child: Container(
                  height: size.height * 0.18,
                  width: size.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      const Text('Available Balance in Raffle Wallet'),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'USD ${context.watch<ProfileNotifier>().user?.balance}',
                        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              SizedBox(
                width: size.width,
                child: const Text(
                  'Select Top - up method',
                  style: TextStyle(
                    color: Color(0xFF252525),
                    fontSize: 16,
                    fontFamily: 'Helvetica Neue',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              Container(
                height: size.height * 0.13,
                width: size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.2, vertical: size.height * 0.01),
                  child: Column(
                    children: [
                      const Text(
                        'Credit/Debit Cards',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: size.height * 0.006,
                      ),
                      const Image(fit: BoxFit.contain, image: AssetImage('assets/images/im_visa.png')),
                    ],
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
