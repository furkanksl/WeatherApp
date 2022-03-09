// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class SelectItemProvider extends ChangeNotifier {
  int _selectedItemIndex = 0;

  int get selectedItemIndex => _selectedItemIndex;

  void setIndex(int index) async {
    _selectedItemIndex = index;
    notifyListeners();
  }
}
