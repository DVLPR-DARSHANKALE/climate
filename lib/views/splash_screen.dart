import 'package:clima/controllers/weather_controller.dart';
import 'package:clima/requests/weather_apis.dart';
import 'package:clima/services/location_service.dart';
import 'package:clima/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String id = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  changeScreen() async {
    await LocationService().init();
    WeatherController().getWeatherData();
    GoRouter.of(context).goNamed(HomeScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}