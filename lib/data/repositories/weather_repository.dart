import 'package:flutter/foundation.dart';
import 'package:weather/api/api_service.dart';
import 'package:weather/api/models/weather_api_response.dart' show WeatherApiResponseX;
import 'package:weather/data/models/weather.dart';

@immutable
class WeatherRepository {
  const WeatherRepository({
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;

  Future<Weather> getWeather() async {
    final response = await _apiService.getWeather();
    final weather = response.toDomain();

    return weather;
  }
}
