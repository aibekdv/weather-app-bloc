import 'condition.dart';

class Hour {
  int? timeEpoch;
  String? time;
  Condition? condition;
  int? cloud;
  int? uv;
  double? tempC;
  int? humidity;
  double? feelslikeC;
  double? windKph;

  Hour({
    this.timeEpoch,
    this.time,
    this.condition,
    this.cloud,
    this.uv,
    this.tempC,
    this.feelslikeC,
    this.humidity,
    this.windKph,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        timeEpoch: (json['time_epoch'] as num?)?.toInt(),
        time: json['time'] as String?,
        tempC: (json['temp_c'] as num?)?.toDouble(),
        feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        cloud: (json['cloud'] as num?)?.toInt(),
        windKph: (json['wind_kph'] as num?)?.toDouble(),
        uv: (json['uv'] as num?)?.toInt(),
        humidity: (json['humidity'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {
        'time_epoch': timeEpoch,
        'time': time,
        'condition': condition?.toJson(),
        'cloud': cloud,
        'uv': uv,
        'humidity': humidity,
        'temp_c': tempC
      };
}
