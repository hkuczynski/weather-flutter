import 'package:flutter/material.dart';
import 'package:weather/l10n/l10n.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.l10n.weatherLoadingErrorText),
    );
  }
}
