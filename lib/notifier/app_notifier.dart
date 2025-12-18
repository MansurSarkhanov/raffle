import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AppNotifier extends ChangeNotifier {
  String appLanguage = "en";

  void changeLanguage(String language, BuildContext context) {
    appLanguage = language;
    notifyListeners();
    Flushbar(
      backgroundColor: Colors.white,
      flushbarPosition: FlushbarPosition.TOP,
      messageText: Text(
        'Language changed to ${_getLanguageName(language)}',
        // state.message,
        style: const TextStyle(color: Colors.black),
      ),
      titleColor: Colors.black,
      borderColor: Colors.white,
      borderRadius: BorderRadius.circular(16),
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 2),
    ).show(context);
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'ru':
        return 'Russian';
      case 'az':
        return 'Azerbaijani';
      default:
        return 'Unknown';
    }
  }

  bool isSelectedLanguage(String language) {
    return appLanguage == language;
  }
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
  int coCurrentPageIndex = 0;

  void changeTabIndex(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  void coChangeTabIndex(int index) {
    coCurrentPageIndex = index;
    notifyListeners();
  }

  void changeCurrentCardIndex(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  final zoomDrawerController = ZoomDrawerController();
  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    notifyListeners();
  }
}
