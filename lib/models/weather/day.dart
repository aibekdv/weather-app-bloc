import 'condition.dart';

class Day {
  double? maxtempC;
  double? mintempC;
  Condition? condition;
  int? uv;

  Day({
    this.maxtempC,
    this.mintempC,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        maxtempC: (json['maxtemp_c'] as num?)?.toDouble(),
        mintempC: (json['mintemp_c'] as num?)?.toDouble(),
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        uv: (json['uv'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => {
        'maxtemp_c': maxtempC,
        'mintemp_c': mintempC,
        'condition': condition?.toJson(),
        'uv': uv,
      };
}
