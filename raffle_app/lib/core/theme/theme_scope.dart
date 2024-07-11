import 'package:flutter/material.dart';
import 'package:raffle_app/core/theme/app_typography.dart';

class ThemeScope extends InheritedWidget {
  const ThemeScope({
    super.key,
    required super.child,
    required this.appColors,
    required this.appTypography,
  });

  final appColors;
  final AppTypography appTypography;

  static ThemeScope of(BuildContext context) {
    final ThemeScope? result = context.dependOnInheritedWidgetOfExactType<ThemeScope>();
    assert(result != null, 'No ThemeScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
