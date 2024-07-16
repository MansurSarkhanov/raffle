import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

enum AppPartSection { left, right }

class AppNotifier extends ChangeNotifier {
  AppPartSection state = AppPartSection.left;

  bool isVisible = false;
  // void setIndex(int index) {
  //   if (index == 0) {
  //     state = AppPartSection.left;
  //     notifyListeners();
  //   } else {
  //     state = AppPartSection.right;
  //     notifyListeners();
  //   }
  // }

  // void visibleBalance() {
  //   isVisible = !isVisible;
  //   print('isVisible $isVisible');
  //   notifyListeners();
  // }

  bool isVisiblePassword = true;
  void visiblePassword() {
    isVisiblePassword = !isVisiblePassword;
    print('isVisiblePassword $isVisiblePassword');
    notifyListeners();
  }

  int currentPageIndex = 0;

  void changeTabIndex(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  void changeCurrentCardIndex(int index) {
    // currentPageIndex = index;
    notifyListeners();
  }

  final zoomDrawerController = ZoomDrawerController();
  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    notifyListeners();
  }
}
