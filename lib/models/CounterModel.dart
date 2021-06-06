import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int counter = 0;

  int readCounter() {
    return counter;
  }

  void increaseCounter() {
    counter++;
    notifyListeners();
  }

  void decreaseCounter(int quantity) {
    counter = counter - quantity;
    notifyListeners();
  }
}
