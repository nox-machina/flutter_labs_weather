import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({Key key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

// var description = weatherData['weather'][0]['main'];
// var temp = weatherData['main']['temp'];
// var feelsLike = weatherData['main']['feels_like'];
// var humidity = weatherData['main']['humidity'];
// var city = weatherData['name'];

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          child: Text(""),
        ),
      ),
    );
  }
}
