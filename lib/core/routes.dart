import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/home_screen.dart';

class Routes {
  static const _home = HomeScreen.routeName;

  static String get home => _home;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
