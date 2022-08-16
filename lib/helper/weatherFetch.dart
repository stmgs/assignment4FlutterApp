import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:assignment4/models/weatherModel.dart';

class WeatherFetch {
  late WeatherModel weather;

  Future<void> getWeather(String city) async {

    final queryParameters = {
      'q': city,
      'appid': '4fcf4c059b8449a613174ea2e84f3e88',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    final jsonData = jsonDecode(response.body);

    weather = WeatherModel(

      temp: jsonData['main']['temp'].toDouble(),
      feelsLike: jsonData['main']['feels_like'].toDouble(),
      low: jsonData['main']['temp_min'].toDouble(),
      high: jsonData['main']['temp_max'].toDouble(),
      description: jsonData['weather'][0]['description'],
    );
  }
}