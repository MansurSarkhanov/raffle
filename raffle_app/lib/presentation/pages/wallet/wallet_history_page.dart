import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:raffle_app/presentation/components/custom_text.dart';
import 'package:raffle_app/presentation/components/go_back_button.dart';

class WalletHistoryPage extends StatefulWidget {
  const WalletHistoryPage({super.key});

  @override
  State<WalletHistoryPage> createState() => _WalletHistoryPageState();
}

class _WalletHistoryPageState extends State<WalletHistoryPage> {
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    );
    return Scaffold(
      backgroundColor: const Color(0xFFF1F1F1),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF1F1F1),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GoBackButton(
                buttonBackColor: const Color(0xFFD9D9D9),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            const Spacer(
              flex: 2,
            ),
            TitleHeading1Widget(
              text: 'Tarixçə',
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 8),
                      fillColor: Colors.white,
                      prefixIconConstraints: const BoxConstraints(minHeight: 20, minWidth: 24),
                      prefixIcon: Image.asset(
                        'assets/icons/ic_search.png',
                        height: 15,
                        width: 15,
                        color: Colors.grey,
                      ),
                      filled: true,
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                      hintText: "Axtar",
                      hintStyle: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 24.0, left: 12),
            child: Row(
              children: [
                TitleHeading1Widget(
                  text: '1 İyul 2024',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24.0, left: 12, right: 12),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/svg/ic_empty_user.svg'),
                      const SizedBox(
                        width: 12,
                      ),
                      const TitleHeading1Widget(
                        text: 'Emil H.',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      const TitleHeading1Widget(
                        text: '+125 \$',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
