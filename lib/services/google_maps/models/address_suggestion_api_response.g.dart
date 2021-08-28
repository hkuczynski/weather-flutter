// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_suggestion_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressSuggestionApiResponse _$AddressSuggestionApiResponseFromJson(
    Map<String, dynamic> json) {
  return AddressSuggestionApiResponse(
    placeId: json['placeId'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$AddressSuggestionApiResponseToJson(
        AddressSuggestionApiResponse instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'description': instance.description,
    };
