import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latidute;
  double longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getLastKnownPosition(desiredAccuracy: LocationAccuracy.low);
      latidute = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('error occured $e');
    }
  }
}
