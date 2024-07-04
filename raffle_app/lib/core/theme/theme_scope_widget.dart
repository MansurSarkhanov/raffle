import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';
import 'theme_scope.dart';

class ThemeScopeWidget extends StatefulWidget {
  const ThemeScopeWidget({
    super.key,
    required this.child,
  });

  final Widget child;
  static ThemeScopeWidgetState? of(BuildContext context) {
    return context.findRootAncestorStateOfType<ThemeScopeWidgetState>();
  }

  @override
  State<ThemeScopeWidget> createState() => ThemeScopeWidgetState();
}

class ThemeScopeWidgetState extends State<ThemeScopeWidget> {
  final String galano = 'Galano';

  @override
  Widget build(BuildContext context) {
    final appColors = AppLightColors();

    final appTypography = AppTypography(
      body1Bold: TextStyle(
        fontSize: 18,
        height: 22 / 18,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      body2Bold: TextStyle(
        fontSize: 17,
        height: 22 / 17,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      calloutBold: TextStyle(
        fontSize: 16,
        height: 21 / 16,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      caption1Bold: TextStyle(
        fontSize: 12,
        height: 16 / 12,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      caption2Bold: TextStyle(
        fontSize: 11,
        height: 13 / 11,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      footnoteBold: TextStyle(
        fontSize: 13,
        height: 18 / 13,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      headlineBold: TextStyle(
        fontSize: 18,
        height: 22 / 18,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      largeTitle1Bold: TextStyle(
        fontSize: 34,
        height: 41 / 34,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      largeTitle2Bold: TextStyle(
        fontSize: 30,
        height: 41 / 30,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      subheadlineBold: TextStyle(
        fontSize: 15,
        height: 20 / 15,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      title1Bold: TextStyle(
        fontSize: 28,
        height: 34 / 28,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      title2Bold: TextStyle(
        fontSize: 24,
        height: 28 / 24,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      title3Bold: TextStyle(
        fontSize: 22,
        height: 28 / 22,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      title4Bold: TextStyle(
        fontSize: 20,
        height: 25 / 20,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w600,
      ),
      body1Regular: TextStyle(
        fontSize: 18,
        height: 22 / 18,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
      body2Regular: TextStyle(
        fontSize: 17,
        height: 22 / 17,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
      calloutRegular: TextStyle(
        fontSize: 16,
        height: 21 / 16,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
      caption1Regular: TextStyle(
        fontSize: 12,
        height: 16 / 12,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
      caption2Regular: TextStyle(
        fontSize: 11,
        height: 13 / 11,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
      footnoteRegular: TextStyle(
        fontSize: 13,
        height: 18 / 13,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
      headlineRegular: TextStyle(
        fontSize: 18,
        height: 22 / 18,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
      largeTitle1Regular: TextStyle(
        fontSize: 34,
        height: 41 / 34,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
      largeTitle2Regular: TextStyle(
        fontSize: 30,
        height: 41 / 30,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
      subheadlineRegular: TextStyle(
        fontSize: 15,
        height: 20 / 15,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
      title1Regular: TextStyle(
        fontSize: 28,
        height: 34 / 28,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
      title2Regular: TextStyle(
        fontSize: 24,
        height: 28 / 24,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
      title3Regular: TextStyle(
        fontSize: 22,
        height: 28 / 22,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
      title4Regular: TextStyle(
        fontSize: 20,
        height: 25 / 20,
        color: Colors.black,
        fontFamily: galano,
        fontWeight: FontWeight.w300,
      ),
    );
    return ThemeScope(
      appColors: appColors,
      appTypography: appTypography,
      child: widget.child,
    );
  }
}
