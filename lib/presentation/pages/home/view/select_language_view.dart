import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:raffle_app/core/theme/theme_ext.dart';
import 'package:raffle_app/notifier/app_notifier.dart';
import 'package:raffle_app/presentation/pages/home/view/profile_detail.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../raffle_co/view/wallet_tab.dart';

class SelectLanguageView extends StatefulWidget {
  const SelectLanguageView({super.key});

  @override
  State<SelectLanguageView> createState() => _SelectLanguageViewState();
}

class _SelectLanguageViewState extends State<SelectLanguageView> {
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
                text: AppLocalizations.of(context)!.language,
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _languageCard(
                          isSelected: context.watch<AppNotifier>().isSelectedLanguage('en'),
                          text: 'English',
                          onPressed: () {
                            context.read<AppNotifier>().changeLanguage('en', context);
                          }),
                      _languageCard(
                          isSelected: context.watch<AppNotifier>().isSelectedLanguage('ru'),
                          text: 'Russian',
                          onPressed: () {
                            context.read<AppNotifier>().changeLanguage('ru', context);
                          }),
                      _languageCard(
                          isSelected: context.watch<AppNotifier>().isSelectedLanguage('az'),
                          text: 'Azerbaijani',
                          onPressed: () {
                            context.read<AppNotifier>().changeLanguage('az', context);
                          }),
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

  _languageCard({
    required String text,
    required VoidCallback onPressed,
    required bool isSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: isSelected ? Colors.green : Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 13),
            child: Row(
              children: [
                Text(
                  text,
                  style: context.typography.body2Bold.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
