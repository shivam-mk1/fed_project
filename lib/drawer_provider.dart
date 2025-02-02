import 'package:flutter/material.dart';

class DrawerProvider extends ChangeNotifier {
  String _currentScreen = 'home';
  String get currentScreen => _currentScreen;

  void setScreen(String screen) {
    _currentScreen = screen;
    notifyListeners();
  }
}
