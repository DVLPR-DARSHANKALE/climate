import 'package:clima/model/weather_map_api_model.dart';
import 'package:clima/requests/weather_apis.dart';
import 'package:flutter/material.dart';

class WeatherController extends ChangeNotifier {
  static WeatherController instance = WeatherController.internal();
  WeatherController.internal();
  factory WeatherController() => instance;

  WeatherMapApiModel? weatherData;

  getWeatherData() async {
    weatherData = await WeatherApis().getCurrentWeatherRequest();
  }
}
