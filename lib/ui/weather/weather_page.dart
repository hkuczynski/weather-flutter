import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/repositories/weather_repository.dart';

import 'bloc/weather_bloc.dart';
import 'widgets/weather_view.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  static PageRoute get route {
    return MaterialPageRoute(
      builder: (context) => const WeatherPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
        weatherRepository: context.read<WeatherRepository>(),
      )..add(const LoadDataEvent()),
      child: const WeatherView(),
    );
  }
}
