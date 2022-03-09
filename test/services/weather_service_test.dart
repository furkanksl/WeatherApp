// ignore_for_file: unused_local_variable, unnecessary_new

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/services/weather_service.dart';

void main() {
  WeatherService weatherService = new WeatherService();

  test('Date Convert to Abbreviation Test', () {
    var result = weatherService.getDayAbbrFromDate('2022-03-09');
    expect(result, 'Wed');
  });

  test('Day Of The Week Abbreviation Test', () {
    var result = weatherService.getDayOfWeekFromDate('2022-03-09');
    expect(result, 'Wednesday');
  });

  test('Degree Unit Change Test', () {
    var result = weatherService.convertUnitToFahrenheit(13);
    expect(result, '55');
  });

  test('Image Url Test', () {
    var result = weatherService.getWeatherImageUrl('c');
    expect(result, 'https://www.metaweather.com/static/img/weather/png/c.png');
  });
}
