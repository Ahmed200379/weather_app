import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart'; //http to access from file

class Weather_Services {
  Future<Weather_Model> get_weather({required String city}) async {
    String baseurl = 'http://api.weatherapi.com/v1';
    String keyurl = '5e3620a972074bc49af104023232302';
    Uri url = Uri.parse(
        '$baseurl/forecast.json?key=$keyurl&q=$city&days=7'); //convert url to uri
    http.Response response =
    await http.get(url); //put url in variable its datatype is Repose
    Map<String, dynamic> data = jsonDecode(
        response.body); //to convert from string to json and store them in Map
    Weather_Model weather = Weather_Model.fromjson(data);
    return weather;
  }
}