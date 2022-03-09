// ignore_for_file: must_be_immutable
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/const/styles.dart';
import 'package:weather_app/core/provider/change_unit_provider.dart';

class WeatherConditionNameWidget extends StatelessWidget {
  String? text;
  bool isSwitched = false;

  ChangeUnitProvider? _unitProvider;

  WeatherConditionNameWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _unitProvider = Provider.of<ChangeUnitProvider>(context);
    return SizedBox(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? 90.w
          : 70.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text!,
            textAlign: TextAlign.left,
            style: Styles().weatherConditionTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('°C'),
              Switch(
                value: _unitProvider!.isSwitched,
                onChanged: (value) => _unitProvider!.setSwitch(value),
                activeTrackColor: const Color(0x83045CA4).withOpacity(0.24),
                activeColor: const Color(0x83045CA4),
              ),
              const Text('°F'),
            ],
          )
        ],
      ),
    );
  }
}
