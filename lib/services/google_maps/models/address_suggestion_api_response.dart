import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/models/address_suggestion.dart';

part 'address_suggestion_api_response.g.dart';

@JsonSerializable()
class AddressSuggestionApiResponse {
  const AddressSuggestionApiResponse({
    required this.placeId,
    required this.description,
  });

  factory AddressSuggestionApiResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressSuggestionApiResponseFromJson(json);

  @JsonKey(name: 'place_id')
  final String placeId;
  final String description;

  Map<String, dynamic> toJson() => _$AddressSuggestionApiResponseToJson(this);
}

extension AddressSuggestionApiResponseX on AddressSuggestionApiResponse {
  AddressSuggestion toDomain() {
    return AddressSuggestion(
      placeId: placeId,
      description: description,
    );
  }
}
