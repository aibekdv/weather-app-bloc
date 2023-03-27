import '../api/api_key.dart';

String apiUrl({String q = "Bishkek"}) {
  String url =
      'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$q&days=7';
  return url;
}
