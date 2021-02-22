import '../services/location.dart';
import '../services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherModel {
  Future<dynamic> getWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    var apikey = env['APIKEY'];
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?units=metric&lat=${location.latitude}&lon=${location.longitude}&appid=${apikey}");

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 600) {
      //Rain
      return 'https://img.icons8.com/cotton/64/000000/rain--v1.png';
    } else if (condition < 700) {
      //Snow
      return "https://img.icons8.com/ultraviolet/40/000000/snow-storm.png";
    } else if (condition == 800) {
      //Clear
      return "https://img.icons8.com/doodle/48/000000/sun--v1.png";
    } else if (condition > 800 && condition < 900) {
      //Cloudy
      return "https://img.icons8.com/ultraviolet/40/000000/cloud.png";
    } else {
      //Anything else
      return "https://img.icons8.com/carbon-copy/100/000000/shrug-emoticon.png";
    }
  }
}
