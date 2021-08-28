import 'package:weather/data/models/city.dart';
import 'package:weather/services/weather_api/models/weather_api_response.dart';

class Weather {
  const Weather({
    required this.humidity,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.pressure,
    required this.state,
    required this.city,
  });

  final num humidity;
  final num temp;
  final num tempMax;
  final num tempMin;
  final num pressure;
  final WeatherDescriptionState? state;
  final City city;
}
