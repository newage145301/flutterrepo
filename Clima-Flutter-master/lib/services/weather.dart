import 'dart:convert';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


class WeatherModel {


  double longitude = 0;
  double latidute;

  Future<> getWeatherModel() async
  {
    var location = Location();
    await location.getCurrentLocation();
    longitude = location.longitude;
    latidute = location.latidute;
    var url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latidute&lon=$longitude&appid=f999012112e0f43a633342d42b30d632&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var data = await networkHelper.getData();
    var weatherData = data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
