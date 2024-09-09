import 'package:flutter/material.dart';

class OnboardingNotifier with ChangeNotifier {
  int _selectedPage = 0;

  int get selectedPage => _selectedPage;

  set setSelectedPage(int page) {
    _selectedPage = page;
    notifyListeners();
  }
}
