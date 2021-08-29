import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/data/models/address_suggestion.dart';
import 'package:weather/data/models/city.dart';
import 'package:weather/data/models/coordinates.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/data/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc({
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        super(WeatherState.london());

  final WeatherRepository _weatherRepository;

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is LoadDataEvent) {
      yield* _mapLoadDataEvent(event, state);
    } else if (event is ChangeAddressEvent) {
      yield* _mapChangeAddressEvent(event, state);
    }
  }

  Stream<WeatherState> _mapLoadDataEvent(
    WeatherEvent event,
    WeatherState state,
  ) async* {
    yield state.copyWith(
      isLoading: true,
      hasError: false,
    );

    try {
      final weather = await _weatherRepository.getWeather(
        address: state.addressSuggestion.name,
      );

      yield state.copyWith(
        isLoading: false,
        hasError: false,
        weather: weather,
      );
    } catch (_) {
      yield state.copyWith(
        isLoading: false,
        hasError: true,
      );
    }
  }

  Stream<WeatherState> _mapChangeAddressEvent(
    ChangeAddressEvent event,
    WeatherState state,
  ) async* {
    yield WeatherState(addressSuggestion: event.addressSuggestion);

    add(const LoadDataEvent());
  }
}
