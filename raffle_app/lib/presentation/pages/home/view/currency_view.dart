import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:raffle_app/presentation/pages/home/view/profile_detail.dart';

import '../../../../raffle_co/view/wallet_tab.dart';

class CurrencyView extends StatefulWidget {
  const CurrencyView({super.key});

  @override
  State<CurrencyView> createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<CurrencyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundColorCard(
            downColor: Color(0xFFEEEEEE),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF1A026C),
                Color(0xFF7518E8),
                Color(0xFFEEEEEE),
              ],
            ),
          ),
          Column(
            children: [
              TopUpAppBar(
                text: AppLocalizations.of(context)!.currency,
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _languageCard(text: 'USD', onPressed: () {}),
                      _languageCard(text: 'Rubl', onPressed: () {}),
                      _languageCard(text: 'AED', onPressed: () {}),
                      _languageCard(text: 'Azn', onPressed: () {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _languageCard({required String text, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 13),
            child: Row(
              children: [
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
