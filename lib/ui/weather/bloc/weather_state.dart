part of 'weather_bloc.dart';

class WeatherState {
  const WeatherState({
    this.isLoading = false,
    this.weather,
  });

  final bool isLoading;
  final Weather? weather;

  WeatherState copyWith({
    bool? isLoading,
    Weather? weather,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      weather: weather ?? this.weather,
    );
  }
}
