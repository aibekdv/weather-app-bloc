import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'app.dart';

void main() {
  // get instance for hourly and current widgets
  final bloc = WeatherBloc();
  GetIt.I.registerSingleton<WeatherBloc>(bloc);
  runApp(MyApp());
}
