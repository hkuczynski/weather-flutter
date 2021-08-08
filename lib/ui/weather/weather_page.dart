import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/ui/weather/bloc/weather_bloc.dart';
import 'package:weather/ui/weather/widgets/forecasts.dart';
import 'package:weather/ui/weather/widgets/todays_weather.dart';

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
            return const _ErrorView();
          }

          return _WeatherLoadedView(weather: weather);
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

class _ErrorView extends StatelessWidget {
  const _ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Weather is currently not available'),
    );
  }
}

class _WeatherLoadedView extends StatelessWidget {
  const _WeatherLoadedView({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TodaysWeather(weather: weather),
        const Expanded(child: Forecasts())
      ],
    );
  }
}
