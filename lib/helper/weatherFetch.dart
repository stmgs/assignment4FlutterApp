import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:assignment4/models/weather.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '4fcf4c059b8449a613174ea2e84f3e88',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    print('${jsonDecode(response.body)}');
    return WeatherResponse.fromJson(json);
  }
}