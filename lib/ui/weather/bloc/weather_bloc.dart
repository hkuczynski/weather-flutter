import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/data/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        super(const WeatherState());

  final WeatherRepository _weatherRepository;

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherViewLoaded) {
      yield* _mapWeatherViewLoadedEvent(event, state);
    }
  }

  Stream<WeatherState> _mapWeatherViewLoadedEvent(
    WeatherEvent event,
    WeatherState state,
  ) async* {
    yield state.copyWith(isLoading: true);

    try {
      final weather = await _weatherRepository.getWeather();

      yield state.copyWith(
        isLoading: false,
        weather: weather,
      );
    } catch (_) {
      // TODO: Add error state
      yield state.copyWith(isLoading: false);
    }
  }
}
