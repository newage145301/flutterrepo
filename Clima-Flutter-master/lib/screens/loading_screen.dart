import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

double longitude = 0;
double latidute;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async {
    var location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latidute = location.latidute;
    var url = 'https://api.openweathermap.org/data/2.5/weather?lat=$latidute&lon=$longitude&appid=f999012112e0f43a633342d42b30d632';
    NetworkHelper networkHelper = NetworkHelper(url);
   var weatherData=  await networkHelper.getData();


  }




@override
void initState() {
  // TODO: implement initState
  super.initState();
  getLocation();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: RaisedButton(
        onPressed: () {
          getLocation();
        },
        child: Text('Get Location'),
      ),
    ),
  );
}}
