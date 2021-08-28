import 'package:weather/data/models/weather.dart';
import 'package:weather/services/weather_api/weather_api_service.dart';
import 'package:weather/services/weather_api/models/weather_api_response.dart'
    show WeatherApiResponseX;

class WeatherRepository {
  const WeatherRepository({
    required WeatherApiService apiService,
  }) : _apiService = apiService;

  final WeatherApiService _apiService;

  Future<Weather> getWeather() async {
    final response = await _apiService.getWeather();
    final weather = response.toDomain();

    return weather;
  }
}
