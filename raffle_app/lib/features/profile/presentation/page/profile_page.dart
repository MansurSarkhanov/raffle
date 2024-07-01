import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/utilities/helper/route.dart';
import 'package:raffle_app/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:raffle_app/features/auth/presentation/pages/auth_page.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_state.dart';
import 'package:raffle_app/features/profile/presentation/page/history_page.dart';
import 'package:raffle_app/features/profile/presentation/page/privacy_policy_view.dart';
import 'package:raffle_app/features/profile/presentation/page/ruffle_wallet_view.dart';
import 'package:raffle_app/features/profile/presentation/page/wishlist_page.dart';
import 'package:raffle_app/features/profile/presentation/widgets/select_language.dart';

import '../../../../injetion.dart';
import '../../../../presentation/components/go_back_button.dart';
import '../../../auth/presentation/widgets/whatsapp_widget.dart';
import '../../data/service/firebase_storage_service.dart';
import '../widgets/call_email_card.dart';
import '../widgets/contact_method.dart';
import '../widgets/custom_profile_listtile.dart';
import '../widgets/profile_title.dart';
import '../widgets/support_controller.dart';
import '../widgets/user_profile_image.dart';
import 'profile_detail_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.controller});
  final TabController? controller;
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final storage = FirebaseStorageService();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xFFF1F1F1),
      body: SafeArea(
        child: Consumer<ProfileNotifier>(
          builder: (context, notifier, child) {
            if (notifier.state is ProfileProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (notifier.state is ProfileSuccess) {
              final userInfo = (notifier.state as ProfileSuccess).user;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GoBackButton(
                            buttonBackColor: const Color(0xFFD9D9D9),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                      UserProfileImage(
                        size: size,
                        userInfo: userInfo,
                        storage: storage,
                        notifier: notifier,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        "${userInfo?.name} ${userInfo?.surname}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'using email ',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${userInfo?.email}",
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        height: size.height * 0.06,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(37), color: Colors.white),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Row(
                              children: [
                                const Text(
                                  'Wallet Balance: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Helvetica Neue',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "${userInfo?.balance}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Helvetica Neue',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const Text(
                                  ' AZN',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontFamily: 'Helvetica Neue',
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 13),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: 53,
                                height: 26,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.00, -1.00),
                                    end: Alignment(0, 1),
                                    colors: [Color(0xFF4D7BFA), Color(0xFF3C0AE1)],
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Top up',
                                  style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      InkWell(
                          onTap: () {
                            SupportController.openWhatsapp(context: context, text: 'Salam', number: '+994776359777');
                          },
                          child: WhatsAppWidget(size: size)),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              widget.controller?.index = 4;
                            },
                            child: const ProfileLittleContainer(
                              title: 'Raffle',
                              imageUrl: 'assets/images/im_ticket.png',
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              widget.controller?.index = 1;
                            },
                            child:
                                const ProfileLittleContainer(title: 'Live', imageUrl: 'assets/images/im_new_live.png'),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                              widget.controller?.index = 3;
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                const ProfileLittleContainer(title: 'Offers', imageUrl: 'assets/images/im_gift.png'),
                                Positioned(
                                  top: -6,
                                  child: Container(
                                    height: 14,
                                    width: 38,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20), color: const Color(0xFFFE344D)),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'New',
                                      style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  RouteHelper.createRoute(
                                      routeName: ChangeNotifierProvider.value(
                                        value: getIt.get<ProfileNotifier>()..getUserInformation(),
                                        builder: (context, child) => const RaffleWalletScreen(),
                                      ),
                                      location: RoutingLocation.rightToLeft));
                            },
                            child:
                                const ProfileLittleContainer(title: 'Wallet', imageUrl: 'assets/images/im_wallet.png'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        width: size.width,
                        //height: size.height * 0.7,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(23), color: Colors.white),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(RouteHelper.createRoute(
                                    routeName: ChangeNotifierProvider.value(
                                        value: getIt.get<ProfileNotifier>()..getUserInformation(),
                                        child: const ProfileDetailView()),
                                    location: RoutingLocation.rightToLeft));
                              },
                              child: const CustomProfileListtileWidget(
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Color(0xFFDCDCDC),
                                  ),
                                  imageUrl: 'assets/icons/ic_person_profile.png',
                                  text: 'Personal Details'),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(RouteHelper.createRoute(
                                    routeName: const WishlistPage(), location: RoutingLocation.rightToLeft));
                              },
                              child: const CustomProfileListtileWidget(
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Color(0xFFDCDCDC),
                                  ),
                                  imageUrl: 'assets/icons/ic_heart.png',
                                  text: 'Wishlist'),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(RouteHelper.createRoute(
                                    routeName: const PrivacyPolicyView(), location: RoutingLocation.rightToLeft));
                              },
                              child: const CustomProfileListtileWidget(
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Color(0xFFDCDCDC),
                                  ),
                                  imageUrl: 'assets/icons/ic_privacy_policy.png',
                                  text: 'Privacy Policy'),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(RouteHelper.createRoute(
                                    routeName: const HistoryPage(), location: RoutingLocation.rightToLeft));
                              },
                              child: const CustomProfileListtileWidget(
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Color(0xFFDCDCDC),
                                  ),
                                  imageUrl: 'assets/icons/ic_history.png',
                                  text: 'History'),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return SelectLangAndCurrency(size: size);
                                  },
                                );
                              },
                              child: CustomProfileListtileWidget(
                                  icon: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Turkish',
                                        style: TextStyle(
                                            height: 0.8,
                                            color: Colors.blue.shade700,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 18,
                                        color: Color(0xFFDCDCDC),
                                      ),
                                    ],
                                  ),
                                  imageUrl: 'assets/icons/ic_language.png',
                                  text: 'Language/Currency'),
                            ),
                            InkWell(
                              onTap: () {
                                openBottomSheet(context, size);
                              },
                              child: const CustomProfileListtileWidget(
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                    color: Color(0xFFDCDCDC),
                                  ),
                                  isBottomDividerActive: false,
                                  imageUrl: 'assets/icons/ic_info.png',
                                  text: 'How it works'),
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      CallEmailCard(size: size),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      const ContactMethod(),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        width: size.width,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                openBottomSheet(context, size);
                              },
                              child: const Text(
                                'Terms of use',
                                style: TextStyle(fontSize: 14, color: Color(0xFFA2A2A2)),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            InkWell(
                              onTap: () {
                                openBottomSheet(context, size);
                              },
                              child: const Text('Privacy Policy',
                                  style: TextStyle(fontSize: 14, color: Color(0xFFA2A2A2))),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            const Text('Delete my account', style: TextStyle(fontSize: 14, color: Color(0xFFA2A2A2))),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            InkWell(
                              onTap: () async {
                                final value = await context.read<AuthNotifier>().signOut();
                                if (value == true && context.mounted) {
                                  Navigator.pushReplacement(
                                      context, MaterialPageRoute(builder: (context) => const AuthPage()));
                                }
                              },
                              child: const Text('Logout', style: TextStyle(fontSize: 14, color: Color(0xFFA2A2A2))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: Text("Error"),
            );
          },
        ),
      ),
    );
  }

  PersistentBottomSheetController openBottomSheet(BuildContext context, Size size) {
    return showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: size.height /** 0.93*/,
            width: size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.04, right: size.width * 0.04, top: size.width * 0.15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GoBackButton(
                        onPressed: () => Navigator.of(context).pop(),
                        buttonBackColor: const Color(0xFFD9D9D9),
                      ),
                      Text(
                        'User Agreement',
                        style: GoogleFonts.anton(letterSpacing: 1, fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.04, top: size.height * 0.03),
                  child: const Text(
                    'User Agreement',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Markdown(
                          data: snapshot.data.toString(),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    future: Future.delayed(const Duration(milliseconds: 1000))
                        .then((value) => rootBundle.loadString('assets/md/privacy_policy.md')),
                  ),
                )
              ],
            ),
          );
        });
  }
}
