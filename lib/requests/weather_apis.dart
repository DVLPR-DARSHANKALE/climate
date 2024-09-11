import 'dart:convert';
import 'dart:developer';

import 'package:clima/main.dart';
import 'package:clima/model/weather_map_api_model.dart';
import 'package:clima/services/location_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherApis {
  static WeatherApis instance = WeatherApis.internal();
  WeatherApis.internal();
  factory WeatherApis() => instance;

  String apikey = "1ef45e729cd06b8a0a29b16df2dc4e79";

  Future<WeatherMapApiModel?> getCurrentWeatherRequest() async {
    Position? position = LocationService().position;

    log(position.toString());
    if (position == null) return null;

    Uri url = Uri.parse(
        "https://api.openweathermap.org/data/3.0/onecall?lat=${position.latitude}&lon=${position.longitude}&exclude={part}&appid=$apikey");
    try {
      http.Response response = await http.get(url);
      logger.w(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        logger.d(data);
        return WeatherMapApiModel.fromJson(data);
      }
    } catch (e) {
      logger.e(e.toString());
    }
  }
}
