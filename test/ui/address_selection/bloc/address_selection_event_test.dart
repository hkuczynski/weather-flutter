import 'package:test/test.dart';
import 'package:weather/ui/address_selection/bloc/address_selection_bloc.dart';

void main() {
  group('AddressSelectionEvent', () {
    group('SearchTextChanged', () {
      test('supports equality', () {
        const text = 'test';
        const languageCode = 'en';
        const instanceA =
            SearchTextChanged(languageCode: languageCode, text: text);
        const instanceB =
            SearchTextChanged(languageCode: languageCode, text: text);
        expect(instanceA, equals(instanceB));
      });
    });
  });
}
