// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/data/repositories/places_repository.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/l10n/l10n.dart';
import 'package:weather/ui/address_selection/bloc/address_selection_bloc.dart';
import 'package:weather/ui/weather/bloc/weather_bloc.dart';

class MockPlacesRepository extends Mock implements PlacesRepository {}

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockWeatherBloc extends Mock implements WeatherBloc {}

class MockAddressSelectionBloc extends Mock implements AddressSelectionBloc {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    WeatherRepository? weatherRepository,
    PlacesRepository? placesRepository,
    WeatherBloc? weatherBloc,
    AddressSelectionBloc? addressSelectionBloc,
  }) {
    return pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: placesRepository ?? MockPlacesRepository(),
          ),
          RepositoryProvider.value(
            value: weatherRepository ?? MockWeatherRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: weatherBloc ?? MockWeatherBloc()),
            BlocProvider.value(
              value: addressSelectionBloc ?? MockAddressSelectionBloc(),
            ),
          ],
          child: MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            home: widget,
          ),
        ),
      ),
    );
  }
}
