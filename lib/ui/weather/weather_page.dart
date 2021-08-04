import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/ui/weather/bloc/weather_bloc.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
        weatherRepository: context.read<WeatherRepository>(),
      )..add(const WeatherViewLoaded()),
      child: const WeatherView(),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const _LoadingView();
          }

          final weather = state.weather;

          if (state.hasError || weather == null) {
            return const _ErrorState();
          }

          return _WeatherLoaded(weather: weather);
        },
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Weather is currently not available'),
    );
  }
}

class _WeatherLoaded extends StatelessWidget {
  const _WeatherLoaded({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Weather has been loaded! ☀️'),
    );
  }
}
