part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {}

class FetchWeatherDataEvent extends WeatherEvent {
  @override
  List<Object?> get props => [];
}

class ChangeHourlyIndexEvent extends WeatherEvent {
  final int index;
  ChangeHourlyIndexEvent(this.index);

  @override
  List<Object?> get props => [index];
}
