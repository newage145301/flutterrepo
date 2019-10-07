
import 'package:flutter/foundation.dart';
import 'dart:math';

class GameData extends ChangeNotifier{

  int  _pinCode;

  int get pinCode=>_pinCode;

  void generateNewPinCode()
  {
    var _random = new Random();
    _pinCode= 1000 + _random.nextInt(9999 - 1000);
     notifyListeners();
  }

}