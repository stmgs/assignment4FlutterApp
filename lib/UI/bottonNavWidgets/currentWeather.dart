import 'package:flutter/material.dart';
import 'package:assignment4/models/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:assignment4/helper/weatherFetch.dart';

class CurrentWeatherPage extends StatefulWidget {

  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  late WeatherResponse _response;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_response != null)
              Column(
                children: [
                  Image.network(_response.iconUrl),
                  Text(
                    '${_response.tempInfo.temperature}°',
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(_response.weatherInfo.description)
                ],
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                    controller: _cityTextController,
                    decoration: InputDecoration(labelText: 'City'),
                    textAlign: TextAlign.center),
              ),
            ),
            ElevatedButton(onPressed: _search, child: Text('Search'))
          ],
        ),
      ),
    );
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}