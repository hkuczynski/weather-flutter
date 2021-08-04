part of 'weather_bloc.dart';

abstract class WeatherEvent {
  const WeatherEvent();
}

class WeatherViewLoaded extends WeatherEvent {
  const WeatherViewLoaded();
}
