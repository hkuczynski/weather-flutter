import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: Container(),
    );
  }
}
