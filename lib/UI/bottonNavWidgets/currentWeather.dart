import 'package:flutter/material.dart';
import 'package:assignment4/models/weatherModel.dart';
import 'package:assignment4/helper//weatherFetch.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrentWeatherPage extends StatefulWidget {

  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  late WeatherModel _weather;
  bool _loading = true;


  @override
  void initState() {
    super.initState();
    getWeather();
  }

  getWeather() async {
    WeatherFetch weatherClass = WeatherFetch();
    await weatherClass.getWeather("Barrie");
    _weather=weatherClass.weather;
    print('weather is : ${_weather.description}');
    setState(() {
      _loading = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        child:  _loading ? Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        )
            : SingleChildScrollView(
          child: Center(
            child: Container(
              child: weatherBox(_weather),
            ),
          )
        )
    );
  }
}

Widget weatherBox(WeatherModel _weather) {

  return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(10.0),
            child:
            Text("${_weather.temp}°C",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
            )
        ),
        Container(
            margin: const EdgeInsets.all(5.0),
            child: Text("${_weather.description}")
        ),
        Container(
            margin: const EdgeInsets.all(5.0),
            child: Text("Feels like:${_weather.feelsLike}°C")
        ),
        Container(
            margin: const EdgeInsets.all(5.0),
            child: Text("Max Temp:${_weather.high}°C L:${_weather.low}°C")
        ),
        Container(
            margin: const EdgeInsets.all(5.0),
            child: Text("Min Temp:${_weather.low}°C")
        ),
      ]

  );
}
