// ignore_for_file: prefer_const_constructors
// ignore_for_file: avoid_dynamic_calls
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather/services/google_maps/models/address_suggestions_api_response.dart';
import 'package:weather/services/google_maps/stubs/address_suggestion_api_response_json.dart';

void main() {
  group('AddressSuggestionsApiResponse', () {
    group('fromJson', () {
      test('works fine with the correct JSON', () {
        final json = jsonDecode(addressSuggestionApiResponseJson);
        expect(
          AddressSuggestionsApiResponse.fromJson(json),
          isInstanceOf<AddressSuggestionsApiResponse>(),
        );
      });

      test('throws an exception if the JSON is invalid', () {
        final json = {
          'aaa': 1,
          'bbb': 'test',
        };
        expect(
          () => AddressSuggestionsApiResponse.fromJson(json),
          throwsA(anything),
        );
      });
    });
  });
}
