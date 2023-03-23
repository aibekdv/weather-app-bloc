import 'package:flutter/material.dart';
import 'bloc/weather_bloc.dart';
import 'screens/screens.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final WeatherBloc bloc = WeatherBloc();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      home: HomeScreen(),
    );
  }
}
