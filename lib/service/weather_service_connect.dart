import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Weather.dart';

class WeatherService {
  static String _apiKey = '473a83f8790b92c234cb526082d88e08';

  static Future<Weather> featchCurrentWeather(
      {String lat = '', String lon = ''}) async {
    var url =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=current&appid=$_apiKey&units=metric';
    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fatal to load weather');
    }
  }

  static Future<List<Weather>> fetchHourlyWeather(
      {String lat = '', String lon = ''}) async {
    var url =
        'https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&exclude=hourly&appid=$_apiKey&units=metric';

    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Weather> data =
          (jsonData['list'] as List<dynamic>).map((item) {
        return Weather.fromJson(item);
      }).toList();

      return data;
    } else {
      throw Exception('Fatal to load weather');
    }
  }
}
