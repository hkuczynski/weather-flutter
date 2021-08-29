import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/models/address_suggestion.dart';

part 'address_suggestion_api_response.g.dart';

@JsonSerializable()
class AddressSuggestionApiResponse {
  const AddressSuggestionApiResponse({
    required this.placeId,
    required this.description,
    required this.structuredFormatting,
  });

  factory AddressSuggestionApiResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressSuggestionApiResponseFromJson(json);

  @JsonKey(name: 'place_id')
  final String placeId;
  final String description;
  @JsonKey(name: 'structured_formatting')
  final StructuredFormattingApiResponse structuredFormatting;

  Map<String, dynamic> toJson() => _$AddressSuggestionApiResponseToJson(this);
}

@JsonSerializable()
class StructuredFormattingApiResponse {
  const StructuredFormattingApiResponse({
    required this.mainText,
    required this.secondaryText,
  });

  factory StructuredFormattingApiResponse.fromJson(Map<String, dynamic> json) =>
      _$StructuredFormattingApiResponseFromJson(json);

  @JsonKey(name: 'main_text')
  final String mainText;
  @JsonKey(name: 'secondary_text')
  final String secondaryText;

  Map<String, dynamic> toJson() =>
      _$StructuredFormattingApiResponseToJson(this);
}

extension AddressSuggestionApiResponseX on AddressSuggestionApiResponse {
  AddressSuggestion toDomain() {
    return AddressSuggestion(
      description: description,
      mainText: structuredFormatting.mainText,
      secondaryText: structuredFormatting.secondaryText,
    );
  }
}
