import 'package:weather/data/models/address_suggestions.dart';
import 'package:weather/services/google_maps/google_maps_api_service.dart';
import 'package:weather/services/google_maps/models/address_suggestions_api_response.dart';

class PlacesRepository {
  const PlacesRepository({
    required GoogleMapsApiService apiService,
  }) : _apiService = apiService;

  final GoogleMapsApiService _apiService;

  Future<AddressSuggestions> getAddressSuggestions({
    required String query,
    required String language,
    required String sessionToken,
  }) async {
    final response = await _apiService.getAddressSuggestions(
      query: query,
      language: language,
      sessionToken: sessionToken,
    );
    final addressSuggestions = response.toDomain();

    return addressSuggestions;
  }
}
