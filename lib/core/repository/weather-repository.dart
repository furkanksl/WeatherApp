// ignore_for_file: file_names

import 'package:weather_app/core/models/weather_response.dart';
import 'package:weather_app/services/weather_service.dart';

import '../models/weather_model.dart';

class WeatherRepository {
  final WeatherService _weatherService = WeatherService();

  Future<List<Weather>?> fetchWeatherData() async {
    final response = await _weatherService.getWeatherData();
    return WeatherResponseModel.fromJson(response).consolidatedWeather;
  }
}
