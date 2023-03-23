part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {}

class WeatherInitial extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoadedState extends WeatherState {
  WeatherLoadedState(this.weather);
  final Weather weather;

  @override
  List<Object?> get props => [weather];
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class HourlyIndexState extends WeatherState {
  HourlyIndexState({
    required this.hourIndex,
  });
  final int hourIndex;

  @override
  List<Object?> get props => [hourIndex];
}
