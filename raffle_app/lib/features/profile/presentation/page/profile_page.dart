import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_notifier.dart';
import 'package:raffle_app/features/profile/presentation/notifier/profile_state.dart';
import 'package:raffle_app/presentation/components/gradient_text.dart';

import '../../../../presentation/components/go_back_button.dart';
import '../../data/service/firebase_storage_service.dart';

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                          height: 61,
                        ),
                        const ProfileComponent(
                          iconData: Icons.language,
                          text: "Language",
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const ProfileComponent(
                          iconData: Icons.currency_lira_sharp,
                          text: "Currency",
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          width: (size.width * 0.82) - 33,
                          child: const Divider(
                            height: 0,
                            color: Color(0xFFD9D9D9),
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
                        )
                      ],
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
    required this.iconData,
    required this.text,
  });
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width * 0.82) - 33,
      child: Row(
        children: [
          Container(
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFF191335)),
              child: Icon(
                iconData,
                color: Colors.white,
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
