import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/data/models/address_suggestion.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/ui/weather/bloc/weather_bloc.dart';

class MockAddressSuggestion extends Mock implements AddressSuggestion {}

class MockWeather extends Mock implements Weather {}

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  group('WeatherBloc', () {
    late WeatherRepository weatherRepository;

    setUp(() {
      weatherRepository = MockWeatherRepository();
    });

    test('initial state is WeatherState.london()', () {
      expect(
        WeatherBloc(weatherRepository: weatherRepository).state,
        equals(WeatherState.london()),
      );
    });

    group('LoadDataEvent', () {
      late Weather weather;

      setUp(() {
        weather = MockWeather();
      });

      blocTest<WeatherBloc, WeatherState>(
        'emits updated state with weather if no error occured',
        build: () => WeatherBloc(weatherRepository: weatherRepository),
        setUp: () => when(
          () => weatherRepository.getWeather(address: any(named: 'address')),
        ).thenAnswer((_) => Future.value(weather)),
        act: (bloc) => bloc.add(const LoadDataEvent()),
        expect: () => <WeatherState>[
          WeatherState.london().copyWith(isLoading: true),
          WeatherState.london().copyWith(weather: weather),
        ],
        verify: (_) {
          verify(
            () => weatherRepository.getWeather(address: any(named: 'address')),
          ).called(1);
        },
      );

      blocTest<WeatherBloc, WeatherState>(
        'emits updated state with hasError if an error occured',
        build: () => WeatherBloc(weatherRepository: weatherRepository),
        setUp: () => when(
          () => weatherRepository.getWeather(address: any(named: 'address')),
        ).thenThrow(Exception()),
        act: (bloc) => bloc.add(const LoadDataEvent()),
        expect: () => <WeatherState>[
          WeatherState.london().copyWith(isLoading: true),
          WeatherState.london().copyWith(hasError: true),
        ],
        verify: (_) {
          verify(
            () => weatherRepository.getWeather(address: any(named: 'address')),
          ).called(1);
        },
      );
    });

    group('ChangeAddressEvent', () {
      late AddressSuggestion addressSuggestion;
      late Weather weather;

      setUp(() {
        addressSuggestion = const AddressSuggestion(description: 'Seattle');
        weather = MockWeather();
      });

      blocTest<WeatherBloc, WeatherState>(
        'emits updated state with addressSuggestion'
        'and triggers data reload',
        build: () => WeatherBloc(weatherRepository: weatherRepository),
        setUp: () => when(
          () => weatherRepository.getWeather(address: any(named: 'address')),
        ).thenAnswer((_) => Future.value(weather)),
        act: (bloc) =>
            bloc.add(ChangeAddressEvent(addressSuggestion: addressSuggestion)),
        expect: () => <WeatherState>[
          WeatherState(addressSuggestion: addressSuggestion),
          WeatherState(addressSuggestion: addressSuggestion)
              .copyWith(isLoading: true),
          WeatherState(addressSuggestion: addressSuggestion)
              .copyWith(weather: weather),
        ],
        verify: (_) {
          verify(
            () => weatherRepository.getWeather(address: any(named: 'address')),
          ).called(1);
        },
      );
    });
  });
}
