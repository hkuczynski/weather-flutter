part of 'weather_bloc.dart';

class WeatherState {
  const WeatherState({
    this.isLoading = false,
    this.hasError = false,
    this.weather,
  });

  final bool isLoading;
  final bool hasError;
  final Weather? weather;

  WeatherState copyWith({
    bool? isLoading,
    bool? hasError,
    Weather? weather,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      weather: weather ?? this.weather,
    );
  }
}
