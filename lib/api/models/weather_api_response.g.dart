// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherApiResponse _$WeatherApiResponseFromJson(Map<String, dynamic> json) {
  return WeatherApiResponse(
    name: json['name'] as String,
    clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
    wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
    coordinates: Coordinates.fromJson(json['coord'] as Map<String, dynamic>),
    visibility: json['visibility'] as num,
    weather: (json['weather'] as List<dynamic>)
        .map((e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList(),
    sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
    base: json['base'] as String,
    main: Main.fromJson(json['main'] as Map<String, dynamic>),
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
      'weather': instance.weather,
      'sys': instance.sys,
      'base': instance.base,
      'main': instance.main,
      'dt': convertDateTimeToMillisecondsSinceEpoch(instance.dt),
    };

Clouds _$CloudsFromJson(Map<String, dynamic> json) {
  return Clouds(
    cloudinessPercent: json['all'] as num,
  );
}

Map<String, dynamic> _$CloudsToJson(Clouds instance) => <String, dynamic>{
      'all': instance.cloudinessPercent,
    };

Wind _$WindFromJson(Map<String, dynamic> json) {
  return Wind(
    direction: json['deg'] as num,
    speed: json['speed'] as num,
  );
}

Map<String, dynamic> _$WindToJson(Wind instance) => <String, dynamic>{
      'deg': instance.direction,
      'speed': instance.speed,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) {
  return Coordinates(
    lat: json['lat'] as num,
    lon: json['lon'] as num,
  );
}

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather(
    icon: json['icon'] as String,
    description: json['description'] as String,
    main: json['main'] as String,
  );
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'icon': instance.icon,
      'description': instance.description,
      'main': instance.main,
    };

Sys _$SysFromJson(Map<String, dynamic> json) {
  return Sys(
    countryCode: json['country'] as String,
    sunrise: convertDateTimeFromMillisecondsSinceEpoch(json['sunrise'] as int),
    sunset: convertDateTimeFromMillisecondsSinceEpoch(json['sunset'] as int),
  );
}

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
      'country': instance.countryCode,
      'sunrise': convertDateTimeToMillisecondsSinceEpoch(instance.sunrise),
      'sunset': convertDateTimeToMillisecondsSinceEpoch(instance.sunset),
    };

Main _$MainFromJson(Map<String, dynamic> json) {
  return Main(
    humidity: json['humidity'] as num,
    temp: json['temp'] as num,
    tempMax: json['temp_max'] as num,
    tempMin: json['temp_min'] as num,
    pressure: json['pressure'] as num,
  );
}

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'humidity': instance.humidity,
      'temp': instance.temp,
      'temp_max': instance.tempMax,
      'temp_min': instance.tempMin,
      'pressure': instance.pressure,
    };
