import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/api/api_service.dart';
import 'package:weather/api/fake_api_service.dart';
import 'package:weather/data/repositories/weather_repository.dart';

class TestDependencyProvider extends StatelessWidget {
  const TestDependencyProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final apiService = FakeApiService();
    final weatherRepository = WeatherRepository(apiService: apiService);

    return DependencyProvider(
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
    final apiService = ApiService();
    final weatherRepository = WeatherRepository(apiService: apiService);

    return DependencyProvider(
      weatherRepository: weatherRepository,
      child: child,
    );
  }
}

class DependencyProvider extends StatelessWidget {
  const DependencyProvider({
    Key? key,
    required this.weatherRepository,
    required this.child,
  }) : super(key: key);

  final WeatherRepository weatherRepository;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: weatherRepository),
      ],
      child: child,
    );
  }
}
