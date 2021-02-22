import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:labs_clima/screens/location_screen.dart';
import '../services/location.dart';
import 'dart:convert' as convert;
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // WeatherModel weatherModel = WeatherModel();

    var weatherData = await WeatherModel().getWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 6,
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Colors.orange[900]),
                backgroundColor: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
