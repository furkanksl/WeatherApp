// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:async';

import '../core/exceptions/network_exception.dart';

class WeatherService {
  final String _baseUrl = "https://www.metaweather.com/api/location/44418/";
  final String _baseImageUrl =
      "https://www.metaweather.com/static/img/weather/png/";

  Future<dynamic> getWeatherData() async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      responseJson = _returnResponse(response);
    } on SocketException {
      // print('No net');
      throw FetchDataException('No Internet connection');
    }
    // print('api get recieved!');
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }

  String getWeatherImageUrl(String abbr) {
    return _baseImageUrl + abbr + '.png';
  }

  String getDayAbbrFromDate(String date) {
    return DateFormat('EEE').format(DateTime.parse(date));
  }

  String getDayOfWeekFromDate(String date) {
    return DateFormat('EEEE').format(DateTime.parse(date));
  }

  String convertUnitToFahrenheit(double celcius) {
    return (1.8 * celcius + 32).toStringAsFixed(0);
  }
}
