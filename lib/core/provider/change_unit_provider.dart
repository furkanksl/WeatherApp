// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class ChangeUnitProvider extends ChangeNotifier {
  bool _isSwitched = false;

  bool get isSwitched => _isSwitched;

  void setSwitch(bool val) async {
    _isSwitched = val;
    notifyListeners();
  }
}
