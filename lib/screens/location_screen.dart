import 'package:flutter/material.dart';
import 'package:charcode/ascii.dart' as ascii;

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  // LocationScreen({Key key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  var description;
  int temp;
  var feelsLike;
  var humidity;
  var city;

  @override
  void initState() {
    super.initState();
    update(widget.locationWeather);
  }

  void update(dynamic weatherData) {
    description = weatherData['weather'][0]['main'];
    double doubleTemp = weatherData['main']['temp'];
    temp = doubleTemp.toInt();
    feelsLike = weatherData['main']['feels_like'];
    humidity = weatherData['main']['humidity'];
    city = weatherData['name'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Clima")),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                  child: Center(
                    child: Text(
                      "How's it looking today?",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                  )),
              Card(
                elevation: 50,
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  // height: MediaQuery.of(context).size.height * 0.85,
                  padding: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: //Card(
                        //elevation: 5,
                        //child:
                        Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          new Container(),
                          Icon(
                            Icons.cloud_rounded,
                            size: 50,
                          ),
                          Text(
                            "${temp}°C",
                            // textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 60, fontWeight: FontWeight.w200),
                          ),
                          new Container()
                        ],
                      ),
                    ),
                  ),
                ),
                //),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 5, 15, 0),
                child: Text(
                  "${city}",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.end,
          ),
        ),
      ),
    );
  }
}
