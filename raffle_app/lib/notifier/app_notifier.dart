import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AppNotifier extends ChangeNotifier {
  bool ticketLeftSelected = true;
  void toggleTicketSwither() {
    ticketLeftSelected = !ticketLeftSelected;
    notifyListeners();
  }

  bool isLeftSelected = true;

  void changeAppPart(BuildContext context) {
    isLeftSelected = !isLeftSelected;
    notifyListeners();
  }

  bool isVisible = false;

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
