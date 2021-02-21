import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:labs_clima/screens/location_screen.dart';
import '../services/location.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert' as convert;
import '../services/networking.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var latitude;
  var longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    var apikey = env['APIKEY'];
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?units=metric&lat=${latitude}&lon=${longitude}&appid=${apikey}");

    var weatherData = await networkHelper.getData();

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
              // Text(
              //   "CLIMA",
              //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              // ),
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
