// ignore_for_file: unnecessary_new

import 'weather_model.dart';

class WeatherResponseModel {
  List<Weather>? consolidatedWeather;

  WeatherResponseModel({this.consolidatedWeather});

  WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['consolidated_weather'] != null) {
      consolidatedWeather = <Weather>[];
      json['consolidated_weather'].forEach((v) {
        consolidatedWeather!.add(new Weather.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (consolidatedWeather != null) {
      data['consolidated_weather'] =
          consolidatedWeather!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
