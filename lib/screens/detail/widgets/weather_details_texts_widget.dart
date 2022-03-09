// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/const/styles.dart';

class WeatherDetailsTextsWidget extends StatelessWidget {
  String? humidity, airPressure, windSpeed;

  WeatherDetailsTextsWidget({
    required this.humidity,
    required this.airPressure,
    required this.windSpeed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Humidty: $humidity%',
            style: Styles().weatherDetailTextStyle,
          ),
          SizedBox(height: 2.w),
          Text(
            'Pressure: $airPressure hPa',
            style: Styles().weatherDetailTextStyle,
          ),
          SizedBox(height: 2.w),
          Text(
            'Wind: $windSpeed km/h',
            style: Styles().weatherDetailTextStyle,
          ),
        ],
      ),
    );
  }
}
