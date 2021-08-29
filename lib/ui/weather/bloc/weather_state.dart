part of 'weather_bloc.dart';

class WeatherState {
  const WeatherState({
    required this.addressSuggestion,
    this.isLoading = false,
    this.hasError = false,
    this.weather,
  });

  factory WeatherState.london() {
    return const WeatherState(
      addressSuggestion: AddressSuggestion(description: 'London'),
    );
  }

  final bool isLoading;
  final bool hasError;
  final AddressSuggestion addressSuggestion;
  final Weather? weather;

  WeatherState copyWith({
    bool? isLoading,
    bool? hasError,
    AddressSuggestion? addressSuggestion,
    Weather? weather,
  }) {
    return WeatherState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      addressSuggestion: addressSuggestion ?? this.addressSuggestion,
      weather: weather ?? this.weather,
    );
  }
}
