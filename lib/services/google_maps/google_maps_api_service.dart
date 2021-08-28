import 'models/address_suggestions_api_response.dart';

class GoogleMapsApiService {
  const GoogleMapsApiService({
    required String apiKey,
  }) : _apiKey = apiKey;

  final String _apiKey;

  Future<AddressSuggestionsApiResponse> getAddressSuggestions({
    required String query,
  }) {
    throw UnimplementedError();
  }
}
