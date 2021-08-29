import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather/data/models/address_suggestion.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/ui/weather/bloc/weather_bloc.dart';

class MockWeather extends Mock implements Weather {}

void main() {
  group('WeatherState', () {
    test('supports equality', () {
      const addressSuggestion = AddressSuggestion(description: 'New York City');
      const hasError = true;
      const isLoading = true;
      final weather = MockWeather();
      final instanceA = WeatherState(
        addressSuggestion: addressSuggestion,
        hasError: hasError,
        isLoading: isLoading,
        weather: weather,
      );
      final instanceB = WeatherState(
        addressSuggestion: addressSuggestion,
        hasError: hasError,
        isLoading: isLoading,
        weather: weather,
      );
      expect(instanceA, equals(instanceB));
    });

    group('copyWith', () {
      test('updates addressSuggestion correctly', () {
        const addressSuggestionA =
            AddressSuggestion(description: 'New York City');
        const addressSuggestionB = AddressSuggestion(description: 'London');
        expect(
            const WeatherState(addressSuggestion: addressSuggestionA)
                .copyWith(addressSuggestion: addressSuggestionB)
                .addressSuggestion,
            equals(addressSuggestionB));
      });

      test('updates hasError correctly', () {
        const addressSuggestion =
            AddressSuggestion(description: 'New York City');
        const hasErrorA = true;
        const hasErrorB = false;
        expect(
            const WeatherState(
              addressSuggestion: addressSuggestion,
              hasError: hasErrorA,
            ).copyWith(hasError: hasErrorB).hasError,
            equals(hasErrorB));
      });

      test('updates isLoading correctly', () {
        const addressSuggestion =
            AddressSuggestion(description: 'New York City');
        const isLoadingA = true;
        const isLoadingB = false;
        expect(
            const WeatherState(
              addressSuggestion: addressSuggestion,
              isLoading: isLoadingA,
            ).copyWith(isLoading: isLoadingB).isLoading,
            equals(isLoadingB));
      });

      test('updates weather correctly', () {
        const addressSuggestion =
            AddressSuggestion(description: 'New York City');
        final weatherA = MockWeather();
        final weatherB = MockWeather();
        expect(
            WeatherState(
              addressSuggestion: addressSuggestion,
              weather: weatherA,
            ).copyWith(weather: weatherB).weather,
            equals(weatherB));
      });
    });
  });
}
