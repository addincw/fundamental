import 'package:flutter/material.dart';

class WalletProvider with ChangeNotifier {
  int _balance = 10000;

  get balance => _balance;
  set balance(value) {
    _balance = value;
    notifyListeners();
  }
}
