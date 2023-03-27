// ignore_for_file: depend_on_referenced_packages
import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather/weather.dart';
import 'package:weather_app/services/get_location.dart';
import 'package:weather_app/utils/api_url.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherDataEvent>(_onFetchData);
    on<ChangeHourlyIndexEvent>(_onChangeIndex);
  }
  // Get location class
  final getLocate = GetLocation();

  // Fetch Data
  _onFetchData(FetchWeatherDataEvent event, Emitter<WeatherState> emit) async {
    try {
      // condition for refresh indicator
      if (state is! WeatherLoadedState) {
        emit(WeatherLoadingState());
      }
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      // Try reading data from the 'action' key. If it doesn't exist, returns null.
      final String? location = prefs.getString('location');

      if (event.isLocation) {
        await getLocate.getLocation();
        // Save an String value to 'action' key.
        await prefs.setString('location', getLocate.path);
        // Loading state
        emit(WeatherLoadingState());
      }

      debugPrint("Location: $location");

      // Condition for function apiUrl's param
      final isLocate = location == null ? apiUrl() : apiUrl(q: location);
      // State loading
      // emit(WeatherLoadingState());
      // Get data from Api
      final Response data = await http.get(Uri.parse(isLocate));
      if (data.statusCode == 200) {
        //  Set data to Weather
        return emit(
          WeatherLoadedState(Weather.fromJson(jsonDecode(data.body))),
        );
      }
      emit(WeatherLoadingFailure(jsonDecode(data.body)));
    } catch (e) {
      Future.error(e);
    } finally {
      event.completer?.complete();
    }
  }

  // Change index weather hour
  _onChangeIndex(ChangeHourlyIndexEvent event, Emitter<WeatherState> emit) {
    // get value and change index
    emit(HourlyIndexState(hourIndex: event.index));
  }
}
