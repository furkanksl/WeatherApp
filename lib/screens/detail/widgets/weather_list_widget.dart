// ignore_for_file: unnecessary_new, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/core/const/styles.dart';
import 'package:weather_app/core/models/weather_model.dart';
import 'package:weather_app/core/provider/change_unit_provider.dart';
import 'package:weather_app/core/provider/select_item_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherListWidget extends StatelessWidget {
  List<Weather>? days;
  WeatherService? _weatherService;

  SelectItemProvider? _selectItemProvider;
  ChangeUnitProvider? _unitProvider;

  WeatherListWidget({required this.days, Key? key}) : super(key: key) {
    _weatherService = new WeatherService();
  }

  @override
  Widget build(BuildContext context) {
    _selectItemProvider = Provider.of<SelectItemProvider>(context);
    _unitProvider = Provider.of<ChangeUnitProvider>(context);

    return Align(
      alignment: MediaQuery.of(context).orientation == Orientation.portrait
          ? Alignment.bottomCenter
          : Alignment.centerRight,
      child: SizedBox(
        height: MediaQuery.of(context).orientation == Orientation.portrait
            ? 30.w
            : 100.w,
        width: MediaQuery.of(context).orientation == Orientation.portrait
            ? 100.w
            : 30.w,
        child: ListView.builder(
          scrollDirection:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? Axis.horizontal
                  : Axis.vertical,
          itemCount: days!.length,
          itemBuilder: (context, index) {
            return Container(
              margin: MediaQuery.of(context).orientation == Orientation.portrait
                  ? const EdgeInsets.only(right: 20)
                  : const EdgeInsets.only(top: 20),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 1,
                child: InkWell(
                  onTap: () => _selectItemProvider!.setIndex(index),
                  borderRadius: BorderRadius.circular(20),
                  overlayColor: MaterialStateProperty.all(
                    Colors.red,
                  ),
                  child: Container(
                    width: 30.w,
                    padding: EdgeInsets.symmetric(vertical: 2.w),
                    decoration: Styles().weatherListItemContainerDecoration,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _weatherService!.getDayAbbrFromDate(
                            days![index].applicableDate.toString(),
                          ),
                        ),
                        SizedBox(
                          height: 15.w,
                          width: 15.w,
                          child: Image.network(
                            _weatherService!.getWeatherImageUrl(
                              days![index].weatherStateAbbr!,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          _unitProvider!.isSwitched
                              ? '${_weatherService!.convertUnitToFahrenheit(days![index].minTemp!)}°/${_weatherService!.convertUnitToFahrenheit(days![index].maxTemp!)}°'
                              : '${days![index].minTemp!.toStringAsFixed(0)} / ${days![index].maxTemp!.toStringAsFixed(0)}',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
