import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_state.dart';

import '../../../../presentation/components/go_back_button.dart';
import '../../../auth/data/service/firebase_storage_service.dart';
import '../../../auth/presentation/widgets/whatsapp_widget.dart';
import '../widgets/custom_profile_listtile.dart';
import '../widgets/profile_title.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final storage = FirebaseStorageService();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GoBackButton(
                            height: 35,
                            width: 70,
                            buttonBackColor: const Color(0xFFD9D9D9),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: const Color(0xFFD9D9D9),
                        radius: size.height * 0.075,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: size.height * 0.055,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage: userInfo != null
                                    ? NetworkImage(userInfo.image ?? '')
                                    : const AssetImage('assets/images/im_person.png'),
                                radius: size.height * 0.045,
                                backgroundColor: const Color(0xFFD9D9D9),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: () async {
                                    await storage.pickImage();
                                    setState(() {});
                                  },
                                  child: CircleAvatar(
                                    radius: size.height * 0.017,
                                    backgroundColor: Colors.white,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.height * 0.01, vertical: size.height * 0.01),
                                      child: const Image(image: AssetImage('assets/icons/ic_plus.png')),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                            // SupportController.openWhatsapp(context: context, text: 'Salam', number: '+994776359777');
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
                              //  Get.offAll(() => const ApplicationSelectionScreen(
                              //     raffleAppIndexComesFromForward: 3,
                              //   )),
                            },
                            child: const ProfileLittleContainer(
                              title: 'Raffle',
                              imageUrl: 'assets/images/im_ticket.png',
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              // Get.offAll(() => const ApplicationSelectionScreen(
                              //     raffleAppIndexComesFromForward: 2,
                              //   )),
                            },
                            child: const ProfileLittleContainer(title: 'Live', imageUrl: 'assets/images/im_live.png'),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              // Get.offAll(() => const ApplicationSelectionScreen(
                              //     raffleAppIndexComesFromForward: 1,
                              //   )),
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
                              // Get.to(() => const RaffleWalletScreen());
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
                                // Get.to(() => const PersonalDetailScreen());
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
                                // Get.to(() => const WishListScreen());
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
                                // Get.to(() => const PrivacyPolicyScreen());
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
                                // Get.to(() => const WinnerCardsScreen());
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
                              onTap: () {},
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
                              onTap: () {},
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
}
