import 'package:weather/data/models/address_suggestion.dart';
import 'package:weather/services/google_maps/google_maps_api_service.dart';
import 'package:weather/services/google_maps/models/address_suggestion_api_response.dart';

class PlacesRepository {
  const PlacesRepository({
    required GoogleMapsApiService apiService,
  }) : _apiService = apiService;

  final GoogleMapsApiService _apiService;

  Future<AddressSuggestion> getAddressSuggestions({
    required String query,
  }) async {
    final response = await _apiService.getAddressSuggestions(query: query);
    final addressSuggestions = response.toDomain();

    return addressSuggestions;
  }
}
