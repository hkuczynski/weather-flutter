import 'package:json_annotation/json_annotation.dart';
import 'package:weather/api/utils/date_time_utils.dart';
import 'package:weather/data/models/weather.dart' as weather_model;

part 'weather_api_response.g.dart';

@JsonSerializable()
class WeatherApiResponse {
  const WeatherApiResponse({
    required this.name,
    required this.clouds,
    required this.wind,
    required this.coordinates,
    required this.visibility,
    required this.weather,
    required this.sys,
    required this.base,
    required this.main,
    required this.dt,
  });

  factory WeatherApiResponse.fromJson(Map<String, dynamic> json) => _$WeatherApiResponseFromJson(json);

  final String name;
  final Clouds clouds;
  final Wind wind;
  @JsonKey(name: 'coord')
  final Coordinates coordinates;
  final num visibility;
  final List<Weather> weather;
  final Sys sys;
  final String base;
  final Main main;
  @JsonKey(
    fromJson: convertDateTimeFromMillisecondsSinceEpoch,
    toJson: convertDateTimeToMillisecondsSinceEpoch,
  )
  final DateTime dt;

  Map<String, dynamic> toJson() => _$WeatherApiResponseToJson(this);
}

extension WeatherApiResponseX on WeatherApiResponse {
  weather_model.Weather toDomain() {
    return weather_model.Weather();
  }
}

@JsonSerializable()
class Clouds {
  const Clouds({
    required this.cloudinessPercent,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  @JsonKey(name: 'all')
  final num cloudinessPercent;

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Wind {
  const Wind({
    required this.direction,
    required this.speed,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  @JsonKey(name: 'deg')
  final num direction;
  final num speed;

  Map<String, dynamic> toJson() => _$WindToJson(this);
}

@JsonSerializable()
class Coordinates {
  const Coordinates({
    required this.lat,
    required this.lon,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);

  final num lat;
  final num lon;

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}

@JsonSerializable()
class Weather {
  const Weather({
    required this.icon,
    required this.description,
    required this.main,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  final String icon;
  final String description;
  final String main;

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Sys {
  const Sys({
    required this.countryCode,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

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

  Map<String, dynamic> toJson() => _$SysToJson(this);
}

@JsonSerializable()
class Main {
  const Main({
    required this.humidity,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.pressure,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  final num humidity;
  final num temp;
  @JsonKey(name: 'temp_max')
  final num tempMax;
  @JsonKey(name: 'temp_min')
  final num tempMin;
  final num pressure;

  Map<String, dynamic> toJson() => _$MainToJson(this);
}
