import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:labs_weather/main.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Weather'),
      ),*/
      body: Center(
        child: ElevatedButton.icon(
            onPressed: () {
              getLocation();
            },
            icon: Icon(Icons.cloud),
            label: Text('Get Location')),
      ),
    );
  }
}
