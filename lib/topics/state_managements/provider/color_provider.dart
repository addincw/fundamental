import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ColorProvider with ChangeNotifier {
  // _ ~ private
  bool _isLightBlue = true;

  get isLightBlue => _isLightBlue;
  set isLightBlue(bool newValue) {
    _isLightBlue = newValue;
    notifyListeners();
  }

  get color => _isLightBlue ? Colors.lightBlue : Colors.amber;
}
