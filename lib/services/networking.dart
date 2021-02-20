import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      var data = convert.jsonDecode(response.body);
      return data;
    } else {
      print(response.statusCode);
    }
  }
}
