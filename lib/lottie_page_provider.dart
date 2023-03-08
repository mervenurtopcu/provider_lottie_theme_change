import 'package:flutter/material.dart';

class LottiePageProvider extends ChangeNotifier{
  bool isVisible = false;


  void changeVisible() {

      isVisible = !isVisible;
      notifyListeners();

  }

  bool get currentVisibilty => isVisible ? true : false;
}