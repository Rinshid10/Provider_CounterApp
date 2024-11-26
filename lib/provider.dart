import 'package:flutter/material.dart';

class NewOne extends ChangeNotifier {
  int count = 0;
  void incere() {
    count++;
    notifyListeners();
  }

  void reset() {
    count = 0;
    notifyListeners();
  }

  void decre() {
    count--;
    notifyListeners();
  }
}
