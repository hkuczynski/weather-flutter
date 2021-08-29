import 'dart:convert';

import 'package:weather/services/google_maps/stubs/address_suggestion_api_response_json.dart';

import 'google_maps_api_service.dart';
import 'models/address_suggestions_api_response.dart';

class FakeGoogleMapsApiService implements GoogleMapsApiService {
  @override
  Future<AddressSuggestionsApiResponse> getAddressSuggestions({
    required String query,
    required String language,
    required String sessionToken,
  }) {
    final json = jsonDecode(addressSuggestionApiResponseJson);
    final response = AddressSuggestionsApiResponse.fromJson(json);

    return Future.value(response);
  }
}
