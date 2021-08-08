// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApiResponse _$WeatherApiResponseFromJson(Map<String, dynamic> json) {
  return WeatherApiResponse(
    name: json['name'] as String,
    clouds: CloudsApiResponse.fromJson(json['clouds'] as Map<String, dynamic>),
    wind: WindApiResponse.fromJson(json['wind'] as Map<String, dynamic>),
    coordinates:
        CoordinatesApiResponse.fromJson(json['coord'] as Map<String, dynamic>),
    visibility: json['visibility'] as num,
    description: (json['weather'] as List<dynamic>)
        .map((e) => DescriptionApiResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    sys: SysApiResponse.fromJson(json['sys'] as Map<String, dynamic>),
    base: json['base'] as String,
    main: MainApiResponse.fromJson(json['main'] as Map<String, dynamic>),
    dt: convertDateTimeFromMillisecondsSinceEpoch(json['dt'] as int),
  );
}

Map<String, dynamic> _$WeatherApiResponseToJson(WeatherApiResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'coord': instance.coordinates,
      'visibility': instance.visibility,
      'weather': instance.description,
      'sys': instance.sys,
      'base': instance.base,
      'main': instance.main,
      'dt': convertDateTimeToMillisecondsSinceEpoch(instance.dt),
    };

CloudsApiResponse _$CloudsApiResponseFromJson(Map<String, dynamic> json) {
  return CloudsApiResponse(
    cloudinessPercent: json['all'] as num,
  );
}

Map<String, dynamic> _$CloudsApiResponseToJson(CloudsApiResponse instance) =>
    <String, dynamic>{
      'all': instance.cloudinessPercent,
    };

WindApiResponse _$WindApiResponseFromJson(Map<String, dynamic> json) {
  return WindApiResponse(
    direction: json['deg'] as num,
    speed: json['speed'] as num,
  );
}

Map<String, dynamic> _$WindApiResponseToJson(WindApiResponse instance) =>
    <String, dynamic>{
      'deg': instance.direction,
      'speed': instance.speed,
    };

CoordinatesApiResponse _$CoordinatesApiResponseFromJson(
    Map<String, dynamic> json) {
  return CoordinatesApiResponse(
    lat: json['lat'] as num,
    lon: json['lon'] as num,
  );
}

Map<String, dynamic> _$CoordinatesApiResponseToJson(
        CoordinatesApiResponse instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

DescriptionApiResponse _$DescriptionApiResponseFromJson(
    Map<String, dynamic> json) {
  return DescriptionApiResponse(
    icon: json['icon'] as String,
    description: json['description'] as String,
    main: _$enumDecode(_$WeatherDescriptionStateEnumMap, json['main'],
        unknownValue: WeatherDescriptionState.clouds),
  );
}

Map<String, dynamic> _$DescriptionApiResponseToJson(
        DescriptionApiResponse instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'description': instance.description,
      'main': _$WeatherDescriptionStateEnumMap[instance.main],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$WeatherDescriptionStateEnumMap = {
  WeatherDescriptionState.thunderstorm: 'Thunderstorm',
  WeatherDescriptionState.drizzle: 'Drizzle',
  WeatherDescriptionState.rain: 'Rain',
  WeatherDescriptionState.snow: 'Snow',
  WeatherDescriptionState.clear: 'Clear',
  WeatherDescriptionState.clouds: 'Clouds',
};

SysApiResponse _$SysApiResponseFromJson(Map<String, dynamic> json) {
  return SysApiResponse(
    countryCode: json['country'] as String,
    sunrise: convertDateTimeFromMillisecondsSinceEpoch(json['sunrise'] as int),
    sunset: convertDateTimeFromMillisecondsSinceEpoch(json['sunset'] as int),
  );
}

Map<String, dynamic> _$SysApiResponseToJson(SysApiResponse instance) =>
    <String, dynamic>{
      'country': instance.countryCode,
      'sunrise': convertDateTimeToMillisecondsSinceEpoch(instance.sunrise),
      'sunset': convertDateTimeToMillisecondsSinceEpoch(instance.sunset),
    };

MainApiResponse _$MainApiResponseFromJson(Map<String, dynamic> json) {
  return MainApiResponse(
    humidity: json['humidity'] as num,
    temp: json['temp'] as num,
    tempMax: json['temp_max'] as num,
    tempMin: json['temp_min'] as num,
    pressure: json['pressure'] as num,
  );
}

Map<String, dynamic> _$MainApiResponseToJson(MainApiResponse instance) =>
    <String, dynamic>{
      'humidity': instance.humidity,
      'temp': instance.temp,
      'temp_max': instance.tempMax,
      'temp_min': instance.tempMin,
      'pressure': instance.pressure,
    };
