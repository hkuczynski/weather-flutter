import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/services/weather_api/models/weather_api_response.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/ui/constants.dart';

class TodaysWeather extends StatelessWidget {
  const TodaysWeather({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: weather.state?.color,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(UIConstants.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCity(context),
              _buildDecription(context),
              const SizedBox(height: 20),
              _buildTemperature(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCity(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      weather.city.name,
      textAlign: TextAlign.center,
      style: theme.textTheme.headline2?.copyWith(color: Colors.white),
    );
  }

  Widget _buildDecription(BuildContext context) {
    final theme = Theme.of(context);
    final today = DateTime.now();
    final dayFormatted = DateFormat(DateFormat.WEEKDAY).format(today);
    final description = "${weather.state?.name ?? "- "}, $dayFormatted";

    return Text(
      description,
      textAlign: TextAlign.center,
      style: theme.textTheme.headline6?.copyWith(color: Colors.white),
    );
  }

  Widget _buildTemperature(BuildContext context) {
    final theme = Theme.of(context);
    final text = '${weather.temp.toInt()}';
    const degree = '°';

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: degree,
            style: theme.textTheme.headline1?.copyWith(
              color: Colors.transparent,
            ),
          ),
          TextSpan(
            text: text,
            style: theme.textTheme.headline1?.copyWith(color: Colors.white),
          ),
          TextSpan(
            text: degree,
            style: theme.textTheme.headline1?.copyWith(color: Colors.white),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

extension WeatherDescriptionStateX on WeatherDescriptionState {
  Color get color {
    return const Color(0xFF1267FF);
  }

  String get name {
    switch (this) {
      case WeatherDescriptionState.clear:
        return 'Clear';
      case WeatherDescriptionState.clouds:
        return 'Clouds';
      case WeatherDescriptionState.drizzle:
        return 'Drizzle';
      case WeatherDescriptionState.rain:
        return 'Rain';
      case WeatherDescriptionState.snow:
        return 'Snow';
      case WeatherDescriptionState.thunderstorm:
        return 'Thunderstorm';
    }
  }
}
