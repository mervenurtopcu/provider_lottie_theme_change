import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier{

  bool isDarkTheme = false;

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => !isDarkTheme ? ThemeData.dark(): ThemeData.light();

}