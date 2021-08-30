import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/data/repositories/weather_repository.dart';
import 'package:weather/ui/weather/bloc/weather_bloc.dart';
import 'package:weather/ui/weather/weather_page.dart';
import 'package:weather/ui/weather/widgets/weather_view.dart';

import '../../helpers/helpers.dart';

class MockWeatherBloc extends Mock implements WeatherBloc {}

void main() {
  group('WeatherPage', () {
    late WeatherRepository weatherRepository;

    setUp(() {
      weatherRepository = MockWeatherRepository();
    });

    testWidgets('renders WeatherView', (tester) async {
      await tester.pumpApp(
        const WeatherPage(),
        weatherRepository: weatherRepository,
      );
      expect(find.byType(WeatherView), findsOneWidget);
    });
  });
}
