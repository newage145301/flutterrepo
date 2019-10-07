import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

class GameData extends ChangeNotifier{

  final _fireStore = Firestore.instance;

  int  _pinCode;

  int get pinCode=>_pinCode;

  void  generateNewPinCode() async
  {
    var _random = new Random();
    var randomiseValue =1000 + _random.nextInt(9999 - 1000);
    //todo db ye sor eğer eğer random değer varsa başka bir numara ayarla
   await _fireStore.collection(randomiseValue.toString()).document("1").setData({
     'expireDate':DateTime.now().add(new Duration(hours:3)),
     'isAdmin':true
   });
    _pinCode=randomiseValue;
    notifyListeners();
  }

}