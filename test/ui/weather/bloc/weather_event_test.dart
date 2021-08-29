import 'package:test/test.dart';
import 'package:weather/data/models/address_suggestion.dart';
import 'package:weather/ui/weather/bloc/weather_bloc.dart';

void main() {
  group('WeatherEvent', () {
    group('ChangeAddressEvent', () {
      test('supports equality', () {
        const addressSuggestion =
            AddressSuggestion(description: 'New York City');
        const instanceA =
            ChangeAddressEvent(addressSuggestion: addressSuggestion);
        const instanceB =
            ChangeAddressEvent(addressSuggestion: addressSuggestion);
        expect(instanceA, equals(instanceB));
      });
    });
  });
}
