import 'Location.dart';
import 'Network.dart';
import 'package:flutter/material.dart';
import '../screens/location_info.dart';
import '../constants.dart';

class weathermodel{

  Future<dynamic> getCityLocation(String cityName) async{
    Network network =  Network(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=$APIKEY'));
    return  await network.getData();
  }

  Future<dynamic> getLocation() async{
    Location locations = Location();
    await locations.getLocations();
    double?  longitude = locations.longitude;
    double? latitude = locations.latitude;


    Network network =  Network(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$APIKEY'));
   return  await network.getData();




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




