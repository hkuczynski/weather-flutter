import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/app/credentials.dart';
import 'package:weather/data/repositories/places_repository.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/services/google_maps/fake_google_maps_api_service.dart';
import 'package:weather/services/google_maps/google_maps_api_service.dart';
import 'package:weather/services/weather_api/fake_weather_api_service.dart';
import 'package:weather/services/weather_api/weather_api_service.dart';

class OfflineDependencyProvider extends StatelessWidget {
  const OfflineDependencyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final placesRepository = PlacesRepository(
      apiService: FakeGoogleMapsApiService(),
    );
    final weatherRepository = WeatherRepository(
      apiService: FakeWeatherApiService(),
    );

    return DependencyProvider(
      placesRepository: placesRepository,
      weatherRepository: weatherRepository,
      child: child,
    );
  }
}

class DevelopmentDependencyProvider extends StatelessWidget {
  const DevelopmentDependencyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final placesRepository = PlacesRepository(
      apiService: GoogleMapsApiService(apiKey: kGoogleAPIKey),
    );
    final weatherRepository = WeatherRepository(
      apiService: WeatherApiService(apiKey: kOpenWeatherMapAPIKey),
    );

    return DependencyProvider(
      placesRepository: placesRepository,
      weatherRepository: weatherRepository,
      child: child,
    );
  }
}

class DependencyProvider extends StatelessWidget {
  const DependencyProvider({
    Key? key,
    required this.placesRepository,
    required this.weatherRepository,
    required this.child,
  }) : super(key: key);

  final PlacesRepository placesRepository;
  final WeatherRepository weatherRepository;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: placesRepository),
        RepositoryProvider.value(value: weatherRepository),
      ],
      child: child,
    );
  }
}
