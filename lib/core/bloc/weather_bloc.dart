import 'dart:async';

import 'package:weather_app/core/models/weather_model.dart';
import 'package:weather_app/services/api_response_service.dart';

import '../repository/weather-repository.dart';

class WeatherBloc {
  WeatherRepository? _weatherRepository;

  StreamController? _weatherListController;

  StreamSink<ApiResponseService<List<Weather>>> get weatherListSink =>
      _weatherListController?.sink
          as StreamSink<ApiResponseService<List<Weather>>>;

  Stream<ApiResponseService<List<Weather>>> get weatherListStream =>
      _weatherListController?.stream
          as Stream<ApiResponseService<List<Weather>>>;

  WeatherBloc() {
    _weatherListController =
        StreamController<ApiResponseService<List<Weather>>>();
    _weatherRepository = WeatherRepository();
    fetchWeatherList();
  }

  fetchWeatherList() async {
    weatherListSink.add(ApiResponseService.loading('Fetching Weather Data'));

    try {
      List<Weather>? weatherList = await _weatherRepository?.fetchWeatherData();
      weatherListSink.add(ApiResponseService.completed(weatherList));
    } catch (e) {
      weatherListSink.add(ApiResponseService.error(e.toString()));
      // print(e);
    }
  }

  dispose() {
    _weatherListController?.close();
  }
}
