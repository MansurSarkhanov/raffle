import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../presentation/components/go_back_button.dart';

class NotificationPrefScreen extends StatefulWidget {
  const NotificationPrefScreen({super.key});

  @override
  State<NotificationPrefScreen> createState() => _NotificationPrefScreenState();
}

class _NotificationPrefScreenState extends State<NotificationPrefScreen> {
  bool isEmailEnabled = false;
  bool isSMSEnabled = false;
  bool isWhatsappEnabled = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.08, right: size.width * 0.04, left: size.width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GoBackButton(
                    buttonBackColor: const Color(0xFFD9D9D9),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                const Text(
                  'Notifications',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          Container(
            width: size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: Colors.white),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.02),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'Promotional Notifications',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Emails',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      CupertinoSwitch(
                        activeColor: const Color(0xFF435784),
                        value: isEmailEnabled,
                        onChanged: (value) {
                          setState(() {
                            isEmailEnabled = value;
                          });
                        },
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'SMS',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      CupertinoSwitch(
                        activeColor: const Color(0xFF435784),
                        value: isSMSEnabled,
                        onChanged: (value) {
                          setState(() {
                            isSMSEnabled = value;
                          });
                        },
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'WhatsApp',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      CupertinoSwitch(
                        activeColor: const Color(0xFF435784),
                        value: isWhatsappEnabled,
                        onChanged: (value) {
                          setState(() {
                            isWhatsappEnabled = value;
                          });
                        },
                      )
                    ],
                  ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
