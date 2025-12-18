import 'package:flutter/material.dart';

interface class AppTypography extends ThemeExtension<AppTypography> {
  AppTypography({
    required this.largeTitle1Regular,
    required this.largeTitle2Regular,
    required this.title1Regular,
    required this.title2Regular,
    required this.title3Regular,
    required this.title4Regular,
    required this.body1Regular,
    required this.body2Regular,
    required this.headlineRegular,
    required this.calloutRegular,
    required this.subheadlineRegular,
    required this.footnoteRegular,
    required this.caption1Regular,
    required this.caption2Regular,
    required this.largeTitle1Bold,
    required this.largeTitle2Bold,
    required this.title1Bold,
    required this.title2Bold,
    required this.title3Bold,
    required this.title4Bold,
    required this.headlineBold,
    required this.body1Bold,
    required this.body2Bold,
    required this.calloutBold,
    required this.subheadlineBold,
    required this.footnoteBold,
    required this.caption1Bold,
    required this.caption2Bold,
  });

  // Regular
  final TextStyle largeTitle1Regular;
  final TextStyle largeTitle2Regular;
  final TextStyle title1Regular;
  final TextStyle title2Regular;
  final TextStyle title3Regular;
  final TextStyle title4Regular;
  final TextStyle headlineRegular;
  final TextStyle body1Regular;
  final TextStyle body2Regular;
  final TextStyle calloutRegular;
  final TextStyle subheadlineRegular;
  final TextStyle footnoteRegular;
  final TextStyle caption1Regular;
  final TextStyle caption2Regular;

  //Bold
  final TextStyle largeTitle1Bold;
  final TextStyle largeTitle2Bold;
  final TextStyle title1Bold;
  final TextStyle title2Bold;
  final TextStyle title3Bold;
  final TextStyle title4Bold;
  final TextStyle headlineBold;
  final TextStyle body1Bold;
  final TextStyle body2Bold;
  final TextStyle calloutBold;
  final TextStyle subheadlineBold;
  final TextStyle footnoteBold;
  final TextStyle caption1Bold;
  final TextStyle caption2Bold;

  @override
  ThemeExtension<AppTypography> copyWith({
    final TextStyle? largeTitle1Regular,
    final TextStyle? largeTitle2Regular,
    final TextStyle? title1Regular,
    final TextStyle? title2Regular,
    final TextStyle? title3Regular,
    final TextStyle? title4Regular,
    final TextStyle? headlineRegular,
    final TextStyle? overlineRegular,
    final TextStyle? body1Regular,
    final TextStyle? body2Regular,
    final TextStyle? calloutRegular,
    final TextStyle? subheadlineRegular,
    final TextStyle? footnoteRegular,
    final TextStyle? caption1Regular,
    final TextStyle? caption2Regular,
    // Bold
    final TextStyle? largeTitle1Bold,
    final TextStyle? largeTitle2Bold,
    final TextStyle? title1Bold,
    final TextStyle? title2Bold,
    final TextStyle? title3Bold,
    final TextStyle? title4Bold,
    final TextStyle? headlineBold,
    final TextStyle? overlineBold,
    final TextStyle? body1Bold,
    final TextStyle? body2Bold,
    final TextStyle? calloutBold,
    final TextStyle? subheadlineBold,
    final TextStyle? footnoteBold,
    final TextStyle? caption1Bold,
    final TextStyle? caption2Bold,
  }) {
    return AppTypography(
      largeTitle1Regular: largeTitle1Regular ?? this.largeTitle1Regular,
      largeTitle2Regular: largeTitle2Regular ?? this.largeTitle2Regular,
      title1Regular: title1Regular ?? this.title1Regular,
      title2Regular: title2Regular ?? this.title2Regular,
      title3Regular: title3Regular ?? this.title3Regular,
      title4Regular: title4Regular ?? this.title4Regular,
      headlineRegular: headlineRegular ?? this.headlineRegular,
      body1Regular: body1Regular ?? this.body1Regular,
      body2Regular: body2Regular ?? this.body2Regular,
      calloutRegular: calloutRegular ?? this.calloutRegular,
      subheadlineRegular: subheadlineRegular ?? this.subheadlineRegular,
      footnoteRegular: footnoteRegular ?? this.footnoteRegular,
      caption1Regular: caption1Regular ?? this.caption1Regular,
      caption2Regular: caption2Regular ?? this.caption2Regular,
      // Bold
      largeTitle1Bold: largeTitle1Bold ?? this.largeTitle1Bold,
      largeTitle2Bold: largeTitle2Bold ?? this.largeTitle2Bold,
      title1Bold: title1Bold ?? this.title1Bold,
      title2Bold: title2Bold ?? this.title2Bold,
      title3Bold: title3Bold ?? this.title3Bold,
      title4Bold: title4Bold ?? this.title4Bold,
      headlineBold: headlineBold ?? this.headlineBold,
      body1Bold: body1Bold ?? this.body1Bold,
      body2Bold: body2Bold ?? this.body2Bold,
      calloutBold: calloutBold ?? this.calloutBold,
      subheadlineBold: subheadlineBold ?? this.subheadlineBold,
      footnoteBold: footnoteBold ?? this.footnoteBold,
      caption1Bold: caption1Bold ?? this.caption1Bold,
      caption2Bold: caption2Bold ?? this.caption2Bold,
    );
  }

  @override
  ThemeExtension<AppTypography> lerp(covariant ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) {
      return this;
    }
    return AppTypography(
      largeTitle1Regular: TextStyle.lerp(largeTitle1Regular, other.largeTitle1Regular, t)!,
      largeTitle2Regular: TextStyle.lerp(largeTitle2Regular, other.largeTitle2Regular, t)!,
      title1Regular: TextStyle.lerp(title1Regular, other.title1Regular, t)!,
      title2Regular: TextStyle.lerp(title2Regular, other.title2Regular, t)!,
      title3Regular: TextStyle.lerp(title3Regular, other.title3Regular, t)!,
      title4Regular: TextStyle.lerp(title4Regular, other.title4Regular, t)!,
      headlineRegular: TextStyle.lerp(headlineRegular, other.headlineRegular, t)!,
      calloutRegular: TextStyle.lerp(calloutRegular, other.calloutRegular, t)!,
      subheadlineRegular: TextStyle.lerp(subheadlineRegular, other.subheadlineRegular, t)!,
      footnoteRegular: TextStyle.lerp(footnoteRegular, other.footnoteRegular, t)!,
      caption1Regular: TextStyle.lerp(caption1Regular, other.caption1Regular, t)!,
      caption2Regular: TextStyle.lerp(caption2Regular, other.caption2Regular, t)!,
      body1Regular: TextStyle.lerp(body1Regular, other.body1Regular, t)!,
      body2Regular: TextStyle.lerp(body2Regular, other.body2Regular, t)!,
      // Bold
      largeTitle1Bold: TextStyle.lerp(largeTitle1Bold, other.largeTitle1Bold, t)!,
      largeTitle2Bold: TextStyle.lerp(largeTitle2Bold, other.largeTitle2Bold, t)!,
      title1Bold: TextStyle.lerp(title1Bold, other.title1Bold, t)!,
      title2Bold: TextStyle.lerp(title2Bold, other.title2Bold, t)!,
      title3Bold: TextStyle.lerp(title3Bold, other.title3Bold, t)!,
      title4Bold: TextStyle.lerp(title4Bold, other.title4Bold, t)!,
      headlineBold: TextStyle.lerp(headlineBold, other.headlineBold, t)!,
      calloutBold: TextStyle.lerp(calloutBold, other.calloutBold, t)!,
      subheadlineBold: TextStyle.lerp(subheadlineBold, other.subheadlineBold, t)!,
      footnoteBold: TextStyle.lerp(footnoteBold, other.footnoteBold, t)!,
      caption1Bold: TextStyle.lerp(caption1Bold, other.caption1Bold, t)!,
      caption2Bold: TextStyle.lerp(caption2Bold, other.caption2Bold, t)!,
      body1Bold: TextStyle.lerp(body1Bold, other.body1Bold, t)!,
      body2Bold: TextStyle.lerp(body2Bold, other.body2Bold, t)!,
    );
  }
}
