import 'package:flutter/material.dart';

import '../../../../presentation/components/go_back_button.dart';
import '../widgets/custom_profile_listtile.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.08,
          right: size.width * 0.04,
          left: size.width * 0.04,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GoBackButton(
                    buttonBackColor: const Color(0xFFD9D9D9),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const Text(
                  'Privacy Policy',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const CustomProfileListtileWidget(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Color(0xFFDCDCDC),
                        ),
                        imageUrl: 'assets/icons/ic_cards.png',
                        text: 'Saved Debit and Credit cards'),
                  ),
                  InkWell(
                    onTap: () {
                      // Get.to(() => const ChangePasswordScreen());
                    },
                    child: const CustomProfileListtileWidget(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Color(0xFFDCDCDC),
                        ),
                        imageUrl: 'assets/icons/ic_password.png',
                        text: 'Change Password'),
                  ),
                  InkWell(
                    onTap: () {
                      // Get.to(() => const NotificationPrefScreen());
                    },
                    child: const CustomProfileListtileWidget(
                        isBottomDividerActive: false,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Color(0xFFDCDCDC),
                        ),
                        imageUrl: 'assets/icons/ic_profile_notification.png',
                        text: 'Notification Preference'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
