// ignore_for_file: must_be_immutable, prefer_final_fields, unnecessary_new

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/const/styles.dart';
import 'package:weather_app/services/weather_service.dart';

import '../../../core/provider/change_unit_provider.dart';

class WeatherDegreeTextWidget extends StatelessWidget {
  double? temprature;

  WeatherDegreeTextWidget({
    required this.temprature,
    Key? key,
  }) : super(key: key);

  ChangeUnitProvider? _unitProvider;

  WeatherService _weatherService = new WeatherService();
  @override
  Widget build(BuildContext context) {
    _unitProvider = Provider.of<ChangeUnitProvider>(context);

    return Text(
      (_unitProvider!.isSwitched
              ? _weatherService.convertUnitToFahrenheit(temprature!)
              : temprature!.toStringAsFixed(0)) +
          '°',
      textAlign: TextAlign.left,
      style: Styles().weatherDegreeTextStyle,
    );
  }
}
