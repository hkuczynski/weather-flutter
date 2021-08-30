import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/models/address_suggestion.dart';
import 'package:weather/ui/address_selection/address_selection_page.dart';
import 'package:weather/ui/constants.dart';

import '../bloc/weather_bloc.dart';
import 'error_view.dart';
import 'loading_view.dart';
import 'todays_weather.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: UIColors.purple,
        accentColor: UIColors.white,
      ),
      child: _buildScaffold(context),
    );
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () =>
              BlocProvider.of<WeatherBloc>(context).add(const LoadDataEvent()),
          icon: const Icon(Icons.refresh),
        ),
        actions: [
          IconButton(
            onPressed: () => _changeLocationPressed(context),
            icon: const Icon(Icons.location_pin),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const LoadingView();
          }

          final weather = state.weather;

          if (state.hasError || weather == null) {
            return const ErrorView();
          }

          return TodaysWeather(weather: weather);
        },
      ),
    );
  }

  void _changeLocationPressed(BuildContext context) async {
    final route = MaterialPageRoute(
      builder: (context) => const AddressSelectionPage(),
    );
    final addressSuggestion = await Navigator.of(context).push(route);
    if (addressSuggestion != null) {
      final event = ChangeAddressEvent(
        addressSuggestion: addressSuggestion as AddressSuggestion,
      );
      BlocProvider.of<WeatherBloc>(context).add(event);
    }
  }
}
