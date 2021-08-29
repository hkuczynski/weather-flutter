import 'dart:convert';

import 'package:http/http.dart';

import 'models/weather_api_response.dart';

class WeatherApiService {
  WeatherApiService({required String apiKey}) : _apiKey = apiKey;

  final String _apiKey;
  final Client _client = Client();

  Future<WeatherApiResponse> getWeather({required String address}) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$address&appid=$_apiKey&units=metric');

    try {
      final response = await _client.get(url);
      final Map<String, dynamic> result = json.decode(response.body);

      if (response.statusCode != 200) {
        throw Exception(
          'Failed to fetch weather. ${result['message']}',
        );
      }

      return WeatherApiResponse.fromJson(result);
    } catch (exception) {
      throw Exception(
        'Failed to fetch weather. Message: ${exception.toString()}',
      );
    }
  }
}
