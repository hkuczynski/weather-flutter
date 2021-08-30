import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:weather/data/models/address_suggestions.dart';
import 'package:weather/ui/address_selection/bloc/address_selection_bloc.dart';

class MockAddressSuggestions extends Mock implements AddressSuggestions {}

void main() {
  group('AddressSelectionState', () {
    test('supports equality', () {
      const hasError = false;
      const isLoading = false;
      final addressSuggestions = MockAddressSuggestions();

      final instanceA = AddressSelectionState(
        hasError: hasError,
        isLoading: isLoading,
        suggestions: addressSuggestions,
      );
      final instanceB = AddressSelectionState(
        hasError: hasError,
        isLoading: isLoading,
        suggestions: addressSuggestions,
      );
      expect(instanceA, equals(instanceB));
    });

    group('factory', () {
      test('initial produces the correct parameters', () {
        expect(
          AddressSelectionState.initial(),
          equals(
            const AddressSelectionState(
              hasError: false,
              isLoading: false,
              suggestions: AddressSuggestions(addressSuggestions: []),
            ),
          ),
        );
      });

      test('loading produces the correct parameters', () {
        expect(
          AddressSelectionState.loading(),
          equals(
            const AddressSelectionState(
              hasError: false,
              isLoading: true,
              suggestions: AddressSuggestions(addressSuggestions: []),
            ),
          ),
        );
      });

      test('error produces the correct parameters', () {
        expect(
          AddressSelectionState.error(),
          equals(
            const AddressSelectionState(
              hasError: true,
              isLoading: false,
              suggestions: AddressSuggestions(addressSuggestions: []),
            ),
          ),
        );
      });
    });

    group('copyWith', () {
      test('updates hasError correctly', () {
        const hasErrorA = true;
        const hasErrorB = false;

        expect(
            AddressSelectionState(
              hasError: hasErrorA,
              isLoading: false,
              suggestions: MockAddressSuggestions(),
            ).copyWith(hasError: hasErrorB).hasError,
            equals(hasErrorB));
      });

      test('updates isLoading correctly', () {
        const isLoadingA = true;
        const isLoadingB = false;

        expect(
            AddressSelectionState(
              hasError: false,
              isLoading: isLoadingA,
              suggestions: MockAddressSuggestions(),
            ).copyWith(isLoading: isLoadingB).isLoading,
            equals(isLoadingB));
      });

      test('updates suggestions correctly', () {
        final suggestionsA = MockAddressSuggestions();
        final suggestionsB = MockAddressSuggestions();

        expect(
            AddressSelectionState(
              hasError: false,
              isLoading: true,
              suggestions: suggestionsA,
            ).copyWith(suggestions: suggestionsB).suggestions,
            equals(suggestionsB));
      });
    });
  });
}
