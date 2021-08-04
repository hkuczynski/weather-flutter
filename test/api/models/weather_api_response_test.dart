// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_dynamic_calls
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather/api/models/weather_api_response.dart';
import 'package:weather/api/stubs/weather_api_response_json.dart';

void main() {
  group('creating from JSON', () {
    test('works fine with the correct JSON', () {
      final json = jsonDecode(weatherApiResponseJson);
      expect(
        WeatherApiResponse.fromJson(json),
        isInstanceOf<WeatherApiResponse>(),
      );
    });

    test('throws an exception if the JSON is invalid', () {
      final json = {
        'aaa': 1,
        'bbb': 'test',
      };
      expect(
        () => WeatherApiResponse.fromJson(json),
        throwsA(anything),
      );
    });
  });
}
