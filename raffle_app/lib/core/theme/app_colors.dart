import 'package:flutter/material.dart';

interface class AppColors extends ThemeExtension<AppColors> {
  AppColors({
    required this.redMain,
    required this.orange,
    required this.yellow,
    required this.pink,
    required this.green,
    required this.greenDark,
    required this.blue,
    required this.blueDark,
  });
  final Color redMain;
  final Color orange;
  final Color yellow;
  final Color pink;
  final Color green;
  final Color greenDark;
  final Color blue;
  final Color blueDark;

  @override
  ThemeExtension<AppColors> copyWith({
    final Color? redMain,
    final Color? orange,
    final Color? yellow,
    final Color? pink,
    final Color? green,
    final Color? greenDark,
    final Color? blue,
    final Color? blueDark,
  }) {
    return AppColors(
      redMain: redMain ?? this.redMain,
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
      pink: pink ?? this.pink,
      green: green ?? this.green,
      greenDark: greenDark ?? this.greenDark,
      blue: blue ?? this.blue,
      blueDark: blueDark ?? this.blueDark,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      redMain: Color.lerp(redMain, other.redMain, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      pink: Color.lerp(pink, other.pink, t)!,
      green: Color.lerp(green, other.green, t)!,
      greenDark: Color.lerp(greenDark, other.greenDark, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      blueDark: Color.lerp(blueDark, other.blueDark, t)!,
    );
  }
}

@protected
class AppLightColors extends AppColors {
  AppLightColors({
    super.blueDark = const Color(0xFF08294F),
    super.blue = const Color(0xFF4370E5),
    super.greenDark = const Color(0xFF094F08),
    super.green = const Color(0xFF2BCE59),
    super.pink = const Color(0xFFFF217E),
    super.yellow = const Color(0xFFFFE600),
    super.orange = const Color(0xFFEF920F),
    super.redMain = const Color(0xFFAF2626),
  });
}
