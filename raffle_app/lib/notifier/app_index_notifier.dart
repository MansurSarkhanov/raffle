import 'package:flutter/material.dart';

enum AppPartSection { left, right }

class AppIndexNotifier extends ChangeNotifier {
  AppPartSection state = AppPartSection.left;
  void setIndex(int index) {
    if (index == 0) {
      state = AppPartSection.left;
      notifyListeners();
    } else {
      state = AppPartSection.right;
      notifyListeners();
    }
  }
}
