// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_suggestions_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressSuggestionsApiResponse _$AddressSuggestionsApiResponseFromJson(
    Map<String, dynamic> json) {
  return AddressSuggestionsApiResponse(
    suggestions: (json['predictions'] as List<dynamic>)
        .map((e) =>
            AddressSuggestionApiResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AddressSuggestionsApiResponseToJson(
        AddressSuggestionsApiResponse instance) =>
    <String, dynamic>{
      'predictions': instance.suggestions,
    };
