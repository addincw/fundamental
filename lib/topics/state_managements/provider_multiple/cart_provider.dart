import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  int _quantity = 0;

  get quantity => _quantity;
  set quantity(value) {
    _quantity = value;
    notifyListeners();
  }
}
