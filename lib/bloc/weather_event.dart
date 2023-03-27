part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {}

class FetchWeatherDataEvent extends WeatherEvent {
  FetchWeatherDataEvent({this.completer, this.isLocation = false});
  final bool isLocation;
  final Completer? completer;
  @override
  List<Object?> get props => [completer];
}

class ChangeHourlyIndexEvent extends WeatherEvent {
  final int index;
  ChangeHourlyIndexEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class FetchLocationDataEvent extends WeatherEvent {
  @override
  List<Object?> get props => [];
}
