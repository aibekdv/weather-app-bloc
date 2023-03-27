import 'package:flutter/material.dart';
import 'package:weather_app/utils/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      routes: appRoutes,
    );
  }
}
