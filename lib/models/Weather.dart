import 'dart:convert';
import 'dart:core';

class Weather {
  final String cityName;
  final int temperature;
  final String iconCode;
  final String description;
  final DateTime time;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.iconCode,
    required this.description,
    required this.time,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        cityName: json['name'],
        description: json['weather'][0]['main'],
        iconCode: json['icon'],
        temperature: json['weather'][0]['icon'],
        time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000));
  }
}
