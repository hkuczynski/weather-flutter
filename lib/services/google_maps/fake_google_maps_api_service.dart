import 'dart:convert';

import 'package:weather/services/google_maps/models/address_suggestion_api_response.dart';
import 'package:weather/services/google_maps/stubs/address_suggestion_api_response_json.dart';

import 'google_maps_api_service.dart';

class FakeGoogleMapsApiService implements GoogleMapsApiService {
  @override
  Future<AddressSuggestionApiResponse> getAddressSuggestions({
    required String query,
  }) {
    final json = jsonDecode(addressSuggestionApiResponseJson);
    final response = AddressSuggestionApiResponse.fromJson(json);

    return Future.value(response);
  }
}
