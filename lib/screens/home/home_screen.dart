// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:weather_app/core/bloc/weather_bloc.dart';
import 'package:weather_app/core/models/weather_model.dart';
import 'package:weather_app/screens/detail/detail_screen.dart';
import 'package:weather_app/screens/loading/loading_screen.dart';
import 'package:weather_app/services/api_response_service.dart';

import '../error/error_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherBloc? _weatherBloc;

  @override
  void initState() {
    super.initState();
    _weatherBloc = WeatherBloc();
  }

  @override
  void dispose() {
    _weatherBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () => _weatherBloc?.fetchWeatherList(),
        child: StreamBuilder<ApiResponseService<List<Weather>>>(
          stream: _weatherBloc?.weatherListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data!.status) {
                case Status.LOADING:
                  return LoadingScreen(loadingMessage: snapshot.data?.message);
                case Status.COMPLETED:
                  return DetailScreen(days: snapshot.data!.data);
                case Status.ERROR:
                  return ErrorScreen(
                    errorMessage: snapshot.data!.message,
                    onRetryPressed: () => _weatherBloc?.fetchWeatherList(),
                  );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
