part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class LoadDataEvent extends WeatherEvent {
  const LoadDataEvent();

  @override
  List<Object?> get props => [];
}

class ChangeAddressEvent extends WeatherEvent {
  const ChangeAddressEvent({required this.addressSuggestion});

  final AddressSuggestion addressSuggestion;

  @override
  List<Object?> get props => [addressSuggestion];
}
