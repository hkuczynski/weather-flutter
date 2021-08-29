import 'dart:convert';

import 'models/weather_api_response.dart';
import 'stubs/weather_api_response_json.dart';
import 'weather_api_service.dart';

class FakeWeatherApiService implements WeatherApiService {
  @override
  Future<WeatherApiResponse> getWeather({required String address}) {
    final json = jsonDecode(weatherApiResponseJson);
    final response = WeatherApiResponse.fromJson(json);

    return Future.value(response);
  }
}
