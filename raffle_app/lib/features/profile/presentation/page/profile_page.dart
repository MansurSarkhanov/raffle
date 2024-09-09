import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/constants/routes.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_state.dart';
import 'package:raffle_app/features/profile/presentation/page/change_password_view.dart';
import 'package:raffle_app/presentation/components/gradient_text.dart';
import 'package:raffle_app/presentation/pages/home/view/favorite_view.dart';
import 'package:raffle_app/presentation/pages/home/view/profile_detail.dart';

import '../../../../presentation/components/go_back_button.dart';
import '../../../auth/presentation/notifier/auth_notifier.dart';
import '../../data/service/firebase_storage_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    //  this.controller
  });
  // final TabController? controller;
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
      body: Consumer<ProfileNotifier>(
        builder: (context, notifier, child) {
          if (notifier.state is ProfileProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (notifier.state is ProfileSuccess) {
            final userInfo = (notifier.state as ProfileSuccess).user;
            return Container(
              width: size.width,
              height: size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                Color(0xFF261C51),
                Color(0xFF241B4C),
              ])),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.18,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/im_raffle_logo.png',
                                height: 44,
                                width: 44,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              GradientText(
                                'raffle',
                                style: context.typography.body2Bold.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFCE2B37),
                                    Color(0xFFFFCE0B),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ProfileComponent(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ProfileDetail(
                                    userModel: userInfo!,
                                  ),
                                ),
                              );
                            },
                            iconPath: 'ic_personal',
                            text: "Personal Details",
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ProfileComponent(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ChangePasswordScreen(),
                                ),
                              );
                            },
                            iconPath: 'ic_password',
                            text: "Change Password",
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ProfileComponent(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const FavoriteView(),
                                ),
                              );
                            },
                            iconPath: 'ic_favori',
                            text: "Favorites",
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ProfileComponent(
                            onTap: () {},
                            iconPath: 'ic_language',
                            text: "Language",
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ProfileComponent(
                            onTap: () {},
                            iconPath: 'ic_currency',
                            text: "Currency",
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          ProfileComponent(
                            onTap: () {},
                            iconPath: 'ic_card',
                            text: "Saved Cards",
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          InkWell(
                            onTap: () async {
                              showGeneralDialog(
                                barrierLabel: "Label",
                                barrierDismissible: true,
                                barrierColor: Colors.black.withOpacity(0.5),
                                transitionDuration: const Duration(milliseconds: 400),
                                context: context,
                                pageBuilder: (context, anim1, anim2) {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 150.h,
                                      margin: const EdgeInsets.only(bottom: 30, left: 12, right: 12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 27),
                                        child: Scaffold(
                                          backgroundColor: Colors.white,
                                          body: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Are you sure logout?',
                                                style: context.typography.body2Bold
                                                    .copyWith(fontSize: 20, color: Colors.black),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: InkWell(
                                                    onTap: () {
                                                      context.pop();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 2,
                                                          color: const Color(0xFF261C51),
                                                        ),
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(
                                                          vertical: 16.0,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'Cancel',
                                                            style: context.typography.body2Bold
                                                                .copyWith(color: Colors.black),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Expanded(
                                                      child: InkWell(
                                                    onTap: () async {
                                                      final value = await context.read<AuthNotifier>().signOut();
                                                      if (value == true && context.mounted) {
                                                        context.goNamed(AppRoutes.auth.name);
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 2,
                                                          color: Colors.red,
                                                        ),
                                                        color: Colors.red,
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(
                                                          vertical: 16.0,
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'Logout',
                                                            style: context.typography.body2Bold
                                                                .copyWith(color: Colors.white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                transitionBuilder: (context, anim1, anim2, child) {
                                  return SlideTransition(
                                    position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
                                    child: child,
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.logout, color: Colors.white),
                                const SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'Logout',
                                  style: context.typography.body2Bold.copyWith(color: Colors.white, fontSize: 19),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          SizedBox(
                            width: (size.width * 0.82) - 33,
                            child: Divider(
                              height: 0,
                              color: const Color(0xFFD9D9D9).withOpacity(0.3),
                              thickness: 5,
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Text(
                            'Get in touch',
                            style: context.typography.body2Bold.copyWith(color: Colors.white, fontSize: 25),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const ContactCard(
                            isGradient: true,
                            text: "Have questions?\nChat with us",
                            color: Colors.transparent,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const ContactCard(
                            text: "Call us:\n+90 555 555 55 55",
                            color: Color(0xFF373057),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const ContactCard(
                            text: "Email us:\nsupport@raffle.com",
                            color: Color(0xFF373057),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          SizedBox(
                            width: (size.width * 0.82) - 33,
                            child: Divider(
                              height: 0,
                              color: const Color(0xFFD9D9D9).withOpacity(0.3),
                              thickness: 5,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Draw Terms & Conditions'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('User Agreement'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Privacy Policy'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Delete Account'),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('v. 1.2.3 (7)'),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text("Error"),
          );
        },
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.text, required this.color, this.isGradient = false});
  final String text;
  final Color color;
  final bool? isGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width * 0.82) - 33,
      decoration: BoxDecoration(
        color: isGradient == true ? null : color,
        gradient: isGradient == true
            ? const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [
                Color(0xFF174032),
                Color(0xFF0C3A17),
              ])
            : null,
        borderRadius: BorderRadius.circular(19),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 19.0, horizontal: 20),
        child: Text(
          text,
          style: context.typography.body2Bold.copyWith(color: Colors.white, fontSize: 19),
        ),
      ),
    );
  }
}

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({
    super.key,
    required this.iconPath,
    required this.text,
    required this.onTap,
  });
  final String iconPath;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: (MediaQuery.of(context).size.width * 0.82) - 33,
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFF191335)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset('assets/svg/$iconPath.svg'),
                )),
            const SizedBox(
              width: 12,
            ),
            Text(
              text,
              style: context.typography.body2Bold.copyWith(color: Colors.white, fontSize: 18),
            ),
            const Spacer(),
            SvgPicture.asset('assets/svg/right_arrow.svg')
          ],
        ),
      ),
    );
  }
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
