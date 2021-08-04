import 'dart:convert';

import 'package:weather/api/api_service.dart';
import 'package:weather/api/models/weather_api_response.dart';
import 'package:weather/api/stubs/weather_api_response_json.dart';

class FakeApiService implements ApiService {
  @override
  Future<WeatherApiResponse> getWeather() {
    final json = jsonDecode(weatherApiResponseJson);
    final response = WeatherApiResponse.fromJson(json);

    return Future.value(response);
  }
}
