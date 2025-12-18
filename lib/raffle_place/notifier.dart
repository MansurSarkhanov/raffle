import 'package:flutter/material.dart';

class RafflePlaceNotifier extends ChangeNotifier {
  int currentPageIndex = 0;

  void changeTabIndex(int index) {
    currentPageIndex = index;
    notifyListeners();
  }
}
