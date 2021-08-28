import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/models/address_suggestions.dart';

import 'address_suggestion_api_response.dart';

part 'address_suggestions_api_response.g.dart';

@JsonSerializable()
class AddressSuggestionsApiResponse {
  const AddressSuggestionsApiResponse({
    required this.suggestions,
  });

  factory AddressSuggestionsApiResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressSuggestionsApiResponseFromJson(json);

  @JsonKey(name: 'predictions')
  final List<AddressSuggestionApiResponse> suggestions;

  Map<String, dynamic> toJson() => _$AddressSuggestionsApiResponseToJson(this);
}

extension AddressSuggestionsApiResponseX on AddressSuggestionsApiResponse {
  AddressSuggestions toDomain() {
    return AddressSuggestions(
      addressSuggestions: suggestions.map((item) => item.toDomain()).toList(),
    );
  }
}
