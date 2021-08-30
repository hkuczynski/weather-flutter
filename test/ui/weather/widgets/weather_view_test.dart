import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/data/models/city.dart';
import 'package:weather/data/models/coordinates.dart';
import 'package:weather/data/models/weather.dart';
import 'package:weather/services/weather_api/models/weather_api_response.dart';
import 'package:weather/ui/address_selection/address_selection_page.dart';
import 'package:weather/ui/weather/bloc/weather_bloc.dart';
import 'package:weather/ui/weather/widgets/error_view.dart';
import 'package:weather/ui/weather/widgets/loading_view.dart';
import 'package:weather/ui/weather/widgets/todays_weather_view.dart';
import 'package:weather/ui/weather/widgets/weather_view.dart';

import '../../../helpers/helpers.dart';

class FakeWeatherEvent extends Fake implements WeatherEvent {}

class FakeWeatherState extends Fake implements WeatherState {}

class MockWeatherBloc extends Mock implements WeatherBloc {}

void main() {
  setUpAll(() {
    registerFallbackValue<WeatherEvent>(FakeWeatherEvent());
    registerFallbackValue<WeatherState>(FakeWeatherState());
  });

  group('WeatherView', () {
    late WeatherBloc weatherBloc;

    setUp(() {
      weatherBloc = MockWeatherBloc();
    });

    testWidgets(
        'renders loading view '
        'when isLoading is true', (tester) async {
      whenListen(
        weatherBloc,
        Stream.fromIterable(
          [WeatherState.london().copyWith(isLoading: true)],
        ),
        initialState: WeatherState.london().copyWith(isLoading: true),
      );

      await tester.pumpApp(
        const WeatherView(),
        weatherBloc: weatherBloc,
      );
      expect(find.byType(LoadingView), findsOneWidget);
    });

    testWidgets(
        'renders error view '
        'when hasError is true', (tester) async {
      whenListen(
        weatherBloc,
        Stream.fromIterable(
          [WeatherState.london().copyWith(hasError: true)],
        ),
        initialState: WeatherState.london(),
      );

      await tester.pumpApp(
        const WeatherView(),
        weatherBloc: weatherBloc,
      );
      expect(find.byType(ErrorView), findsOneWidget);
    });

    testWidgets(
        'renders todays weather view '
        'when loaded data successfully', (tester) async {
      const weather = Weather(
        humidity: 123,
        temp: 12,
        tempMax: 12,
        tempMin: 10,
        pressure: 123,
        state: WeatherDescriptionState.drizzle,
        city: City(
          name: 'Tokyo',
          coordinates: Coordinates(lat: 0, lon: 0),
        ),
      );

      whenListen(
        weatherBloc,
        Stream.fromIterable([WeatherState.london().copyWith(weather: weather)]),
        initialState: WeatherState.london().copyWith(weather: weather),
      );

      await tester.pumpApp(
        const WeatherView(),
        weatherBloc: weatherBloc,
      );
      expect(find.byType(TodaysWeatherView), findsOneWidget);
    });

    group('reload button', () {
      late Key buttonKey;

      setUp(() {
        buttonKey = const Key('weatherPage_weatherView_reloadButton');
      });

      testWidgets('renders reload button', (tester) async {
        whenListen(
          weatherBloc,
          Stream.fromIterable([WeatherState.london()]),
          initialState: WeatherState.london(),
        );

        await tester.pumpApp(
          const WeatherView(),
          weatherBloc: weatherBloc,
        );
        expect(
          find.byKey(buttonKey),
          findsOneWidget,
        );
      });

      testWidgets('triggers data reload when tapped', (tester) async {
        whenListen(
          weatherBloc,
          Stream.fromIterable([WeatherState.london()]),
          initialState: WeatherState.london(),
        );

        await tester.pumpApp(
          const WeatherView(),
          weatherBloc: weatherBloc,
        );

        final buttonFinder = find.byKey(buttonKey);
        await tester.tap(buttonFinder);

        tester.widget<IconButton>(buttonFinder).onPressed!();

        expect(buttonFinder, findsOneWidget);

        verify(() => weatherBloc.add(const LoadDataEvent())).called(2);
      });
    });

    group('address selection button', () {
      late Key buttonKey;

      setUp(() {
        buttonKey = const Key('weatherPage_weatherView_addressSelectionButton');
      });

      testWidgets('renders address selection button', (tester) async {
        whenListen(
          weatherBloc,
          Stream.fromIterable([WeatherState.london()]),
          initialState: WeatherState.london(),
        );

        await tester.pumpApp(
          const WeatherView(),
          weatherBloc: weatherBloc,
        );
        expect(
          find.byKey(buttonKey),
          findsOneWidget,
        );
      });

      testWidgets('opens address selection page when tapped', (tester) async {
        whenListen(
          weatherBloc,
          Stream.fromIterable([WeatherState.london()]),
          initialState: WeatherState.london(),
        );

        await tester.pumpApp(
          const WeatherView(),
          weatherBloc: weatherBloc,
        );

        final buttonFinder = find.byKey(buttonKey);
        await tester.tap(buttonFinder);

        tester.widget<IconButton>(buttonFinder).onPressed!();

        await tester.pumpAndSettle();

        expect(find.byType(AddressSelectionPage), findsOneWidget);
      });
    });
  });
}
