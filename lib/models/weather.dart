import 'forecast.dart';
import 'location.dart';

class Weather {
  Location? location;
  Forecast? forecast;

  Weather({this.location, this.forecast});

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        forecast: json['forecast'] == null
            ? null
            : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'forecast': forecast?.toJson(),
      };
}
