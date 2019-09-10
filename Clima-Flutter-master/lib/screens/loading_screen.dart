import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
//    var location = Location();
//    await location.getCurrentLocation();
//    print(location.longitude);
//    print(location.latidute);

    getDataFromApi();
  }

  void getDataFromApi() async {
    http.Response response;

    try
    {
      response = await http.get(
          'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    String data =response.body;
      int id= jsonDecode(data)['weather'][0]['id'];
      String cityName= jsonDecode(data)['name'];
      double temp= jsonDecode(data)['main']['temp'];

      print('ID:$id CityName:$cityName Temprature:$temp');
    } catch(e)
    {

    }


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
  }
}
