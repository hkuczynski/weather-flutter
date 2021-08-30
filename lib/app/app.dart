// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:weather/l10n/l10n.dart';
import 'package:weather/ui/constants.dart';
import 'package:weather/ui/weather/weather_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: UIColors.white,
        accentColor: UIColors.purple,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: UIColors.black),
          elevation: 0,
          color: Colors.transparent,
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const WeatherPage(),
    );
  }
}
