// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:weather/app/app.dart';
import 'package:weather/ui/weather/weather_page.dart';

import 'helpers/helpers.dart';

void main() {
  group('App', () {
    testWidgets('renders WeatherPage', (tester) async {
      await tester.pumpApp(const App());
      expect(find.byType(WeatherPage), findsOneWidget);
    });
  });
}
