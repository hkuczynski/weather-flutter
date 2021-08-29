import 'dart:convert';

import 'package:http/http.dart';

import 'models/address_suggestions_api_response.dart';

class GoogleMapsApiService {
  GoogleMapsApiService({required String apiKey}) : _apiKey = apiKey;

  final String _apiKey;
  final Client _client = Client();

  Future<AddressSuggestionsApiResponse> getAddressSuggestions({
    required String query,
    required String language,
    required String sessionToken,
  }) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&types=address&language=$language&key=$_apiKey&sessiontoken=$sessionToken');

    final response = await _client.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch address suggestion');
    }

    final Map<String, dynamic> result = json.decode(response.body);

    if (result['status'] == 'OK') {
      return AddressSuggestionsApiResponse.fromJson(result);
    }
    if (result['status'] == 'ZERO_RESULTS') {
      return const AddressSuggestionsApiResponse(suggestions: []);
    }

    throw Exception(result['error_message']);
  }
}
