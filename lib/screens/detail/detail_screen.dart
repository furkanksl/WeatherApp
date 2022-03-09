// ignore_for_file: unnecessary_new, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/core/const/styles.dart';
import 'package:weather_app/core/models/weather_model.dart';
import 'package:weather_app/screens/detail/widgets/weather_condition_image_widget.dart';
import 'package:weather_app/screens/detail/widgets/weather_condition_name_widget.dart';
import 'package:weather_app/screens/detail/widgets/weather_degree_text_widget.dart';
import 'package:weather_app/screens/detail/widgets/weather_details_texts_widget.dart';
import 'package:weather_app/services/weather_service.dart';

import '../../core/provider/select_item_provider.dart';
import 'widgets/weather_list_widget.dart';

class DetailScreen extends StatefulWidget {
  List<Weather>? days;

  DetailScreen({required this.days, Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final WeatherService _weatherService = new WeatherService();

  SelectItemProvider? _selectItemProvider;

  @override
  Widget build(BuildContext context) {
    _selectItemProvider = Provider.of<SelectItemProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              fillOverscroll: true,
              hasScrollBody: true,
              child: Container(
                height: 100.h,
                width: 100.w,
                padding: EdgeInsets.all(5.w),
                color: Colors.white,
                child:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? portraitLayout()
                        : landscapeLayout(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget landscapeLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WeatherConditionNameWidget(
              text: widget.days![_selectItemProvider!.selectedItemIndex]
                  .weatherStateName!,
            ),
            SizedBox(height: 1.w),
            WeatherConditionImageWidget(
              imageUrl: _weatherService.getWeatherImageUrl(
                widget.days![_selectItemProvider!.selectedItemIndex]
                    .weatherStateAbbr!,
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _weatherService.getDayOfWeekFromDate(
                widget.days![_selectItemProvider!.selectedItemIndex]
                    .applicableDate!,
              ),
              style: Styles().weatherDayOfWeekTextStyle.copyWith(
                    fontSize: 35.sp,
                  ),
            ),
            WeatherDegreeTextWidget(
              temprature:
                  widget.days![_selectItemProvider!.selectedItemIndex].theTemp!,
            ),
            SizedBox(height: 3.w),
            WeatherDetailsTextsWidget(
              humidity: widget
                  .days![_selectItemProvider!.selectedItemIndex].humidity!
                  .toString(),
              airPressure: widget
                  .days![_selectItemProvider!.selectedItemIndex].airPressure!
                  .toStringAsFixed(0),
              windSpeed: widget
                  .days![_selectItemProvider!.selectedItemIndex].windSpeed!
                  .toStringAsFixed(0),
            ),
          ],
        ),
        //SizedBox(width: 5.w),
        WeatherListWidget(days: widget.days)
      ],
    );
  }

  Widget portraitLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          _weatherService.getDayOfWeekFromDate(
            widget
                .days![_selectItemProvider!.selectedItemIndex].applicableDate!,
          ),
          style: Styles().weatherDayOfWeekTextStyle,
        ),
        WeatherConditionNameWidget(
          text: widget
              .days![_selectItemProvider!.selectedItemIndex].weatherStateName!,
        ),
        SizedBox(height: 1.w),
        WeatherConditionImageWidget(
          imageUrl: _weatherService.getWeatherImageUrl(
            widget.days![_selectItemProvider!.selectedItemIndex]
                .weatherStateAbbr!,
          ),
        ),
        SizedBox(height: 2.w),
        WeatherDegreeTextWidget(
          temprature:
              widget.days![_selectItemProvider!.selectedItemIndex].theTemp!,
        ),
        SizedBox(height: 1.w),
        WeatherDetailsTextsWidget(
          humidity: widget
              .days![_selectItemProvider!.selectedItemIndex].humidity!
              .toString(),
          airPressure: widget
              .days![_selectItemProvider!.selectedItemIndex].airPressure!
              .toStringAsFixed(0),
          windSpeed: widget
              .days![_selectItemProvider!.selectedItemIndex].windSpeed!
              .toStringAsFixed(0),
        ),
        Expanded(
          child: WeatherListWidget(days: widget.days),
        )
      ],
    );
  }
}
