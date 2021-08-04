part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {
  const WeatherEvent();
}

class WeatherViewLoaded extends WeatherEvent {
  const WeatherViewLoaded();
}
