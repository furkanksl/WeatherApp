import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/core/provider/change_unit_provider.dart';
import 'package:weather_app/core/provider/select_item_provider.dart';

import 'core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SelectItemProvider>(
          create: (context) => SelectItemProvider(),
        ),
        ChangeNotifierProvider<ChangeUnitProvider>(
          create: (context) => ChangeUnitProvider(),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            onGenerateRoute: (RouteSettings settings) => Routes.onGenerateRoute(
              settings,
            ),
            initialRoute: Routes.home,
          );
        },
      ),
    );
  }
}
