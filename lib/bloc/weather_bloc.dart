// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/utils/api_url.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherDataEvent>(_onFetchData);
    on<ChangeHourlyIndexEvent>(_onChangeIndex);
  }

  _onFetchData(FetchWeatherDataEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    final Response data = await http.get(Uri.parse(apiUrl()));
    emit(WeatherLoadedState(Weather.fromJson(jsonDecode(data.body))));
  }

  _onChangeIndex(ChangeHourlyIndexEvent event, Emitter<WeatherState> emit) {
    emit(HourlyIndexState(hourIndex: event.index));
  }
}
