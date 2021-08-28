import 'package:json_annotation/json_annotation.dart';
import 'package:weather/data/models/city.dart';
import 'package:weather/data/models/coordinates.dart';
import 'package:weather/data/models/weather.dart' as weather_model;

import '../utils/date_time_utils.dart';

part 'weather_api_response.g.dart';

@JsonSerializable()
class WeatherApiResponse {
  const WeatherApiResponse({
    required this.name,
    required this.clouds,
    required this.wind,
    required this.coordinates,
    required this.visibility,
    required this.description,
    required this.sys,
    required this.base,
    required this.main,
    required this.dt,
  });

  factory WeatherApiResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherApiResponseFromJson(json);

  final String name;
  final CloudsApiResponse clouds;
  final WindApiResponse wind;
  @JsonKey(name: 'coord')
  final CoordinatesApiResponse coordinates;
  final num visibility;
  @JsonKey(name: 'weather')
  final List<DescriptionApiResponse> description;
  final SysApiResponse sys;
  final String base;
  final MainApiResponse main;
  @JsonKey(
    fromJson: convertDateTimeFromMillisecondsSinceEpoch,
    toJson: convertDateTimeToMillisecondsSinceEpoch,
  )
  final DateTime dt;

  Map<String, dynamic> toJson() => _$WeatherApiResponseToJson(this);
}

extension WeatherApiResponseX on WeatherApiResponse {
  weather_model.Weather toDomain() {
    return weather_model.Weather(
      temp: main.temp,
      tempMax: main.tempMax,
      tempMin: main.tempMin,
      pressure: main.pressure,
      humidity: main.humidity,
      state: description.isNotEmpty ? description.first.main : null,
      city: City(
        name: name,
        coordinates: Coordinates(
          lat: coordinates.lat.toDouble(),
          lon: coordinates.lon.toDouble(),
        ),
      ),
    );
  }
}

@JsonSerializable()
class CloudsApiResponse {
  const CloudsApiResponse({
    required this.cloudinessPercent,
  });

  factory CloudsApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CloudsApiResponseFromJson(json);

  @JsonKey(name: 'all')
  final num cloudinessPercent;

  Map<String, dynamic> toJson() => _$CloudsApiResponseToJson(this);
}

@JsonSerializable()
class WindApiResponse {
  const WindApiResponse({
    required this.direction,
    required this.speed,
  });

  factory WindApiResponse.fromJson(Map<String, dynamic> json) =>
      _$WindApiResponseFromJson(json);

  @JsonKey(name: 'deg')
  final num direction;
  final num speed;

  Map<String, dynamic> toJson() => _$WindApiResponseToJson(this);
}

@JsonSerializable()
class CoordinatesApiResponse {
  const CoordinatesApiResponse({
    required this.lat,
    required this.lon,
  });

  factory CoordinatesApiResponse.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesApiResponseFromJson(json);

  final num lat;
  final num lon;

  Map<String, dynamic> toJson() => _$CoordinatesApiResponseToJson(this);
}

enum WeatherDescriptionState {
  @JsonValue('Thunderstorm')
  thunderstorm,
  @JsonValue('Drizzle')
  drizzle,
  @JsonValue('Rain')
  rain,
  @JsonValue('Snow')
  snow,
  @JsonValue('Clear')
  clear,
  @JsonValue('Clouds')
  clouds,
}

@JsonSerializable()
class DescriptionApiResponse {
  const DescriptionApiResponse({
    required this.icon,
    required this.description,
    required this.main,
  });

  factory DescriptionApiResponse.fromJson(Map<String, dynamic> json) =>
      _$DescriptionApiResponseFromJson(json);

  final String icon;
  final String description;
  @JsonKey(unknownEnumValue: WeatherDescriptionState.clouds)
  final WeatherDescriptionState main;

  Map<String, dynamic> toJson() => _$DescriptionApiResponseToJson(this);
}

@JsonSerializable()
class SysApiResponse {
  const SysApiResponse({
    required this.countryCode,
    required this.sunrise,
    required this.sunset,
  });

  factory SysApiResponse.fromJson(Map<String, dynamic> json) =>
      _$SysApiResponseFromJson(json);

  @JsonKey(name: 'country')
  final String countryCode;
  @JsonKey(
    fromJson: convertDateTimeFromMillisecondsSinceEpoch,
    toJson: convertDateTimeToMillisecondsSinceEpoch,
  )
  final DateTime sunrise;
  @JsonKey(
    fromJson: convertDateTimeFromMillisecondsSinceEpoch,
    toJson: convertDateTimeToMillisecondsSinceEpoch,
  )
  final DateTime sunset;

  Map<String, dynamic> toJson() => _$SysApiResponseToJson(this);
}

@JsonSerializable()
class MainApiResponse {
  const MainApiResponse({
    required this.humidity,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.pressure,
  });

  factory MainApiResponse.fromJson(Map<String, dynamic> json) =>
      _$MainApiResponseFromJson(json);

  final num humidity;
  final num temp;
  @JsonKey(name: 'temp_max')
  final num tempMax;
  @JsonKey(name: 'temp_min')
  final num tempMin;
  final num pressure;

  Map<String, dynamic> toJson() => _$MainApiResponseToJson(this);
}
