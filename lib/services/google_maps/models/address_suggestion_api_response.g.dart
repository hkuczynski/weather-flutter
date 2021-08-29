// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_suggestion_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressSuggestionApiResponse _$AddressSuggestionApiResponseFromJson(
    Map<String, dynamic> json) {
  return AddressSuggestionApiResponse(
    placeId: json['place_id'] as String,
    description: json['description'] as String,
    structuredFormatting: StructuredFormattingApiResponse.fromJson(
        json['structured_formatting'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AddressSuggestionApiResponseToJson(
        AddressSuggestionApiResponse instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'description': instance.description,
      'structured_formatting': instance.structuredFormatting,
    };

StructuredFormattingApiResponse _$StructuredFormattingApiResponseFromJson(
    Map<String, dynamic> json) {
  return StructuredFormattingApiResponse(
    mainText: json['main_text'] as String,
    secondaryText: json['secondary_text'] as String,
  );
}

Map<String, dynamic> _$StructuredFormattingApiResponseToJson(
        StructuredFormattingApiResponse instance) =>
    <String, dynamic>{
      'main_text': instance.mainText,
      'secondary_text': instance.secondaryText,
    };
