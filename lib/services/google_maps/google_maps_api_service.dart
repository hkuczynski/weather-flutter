import 'models/address_suggestion_api_response.dart';

class GoogleMapsApiService {
  const GoogleMapsApiService({
    required String apiKey,
  }) : _apiKey = apiKey;

  final String _apiKey;

  Future<AddressSuggestionApiResponse> getAddressSuggestions({
    required String query,
  }) {
    throw UnimplementedError();
  }
}
