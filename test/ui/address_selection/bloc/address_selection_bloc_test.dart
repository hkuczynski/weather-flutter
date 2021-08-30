import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather/data/models/address_suggestions.dart';
import 'package:weather/data/repositories/places_repository.dart';
import 'package:weather/ui/address_selection/bloc/address_selection_bloc.dart';

import 'address_selection_state_test.dart';

class MockPlacesRepository extends Mock implements PlacesRepository {}

void main() {
  group('AddressSelectionBloc', () {
    late PlacesRepository placesRepository;

    setUp(() {
      placesRepository = MockPlacesRepository();
    });

    test('initial state is AddressSelectionState.initial()', () {
      expect(
        AddressSelectionBloc(placesRepository: placesRepository).state,
        equals(AddressSelectionState.initial()),
      );
    });

    group('SearchTextChanged', () {
      late AddressSuggestions addressSuggestions;

      setUp(() {
        addressSuggestions = MockAddressSuggestions();
      });

      blocTest<AddressSelectionBloc, AddressSelectionState>(
        'does not emit any state if the text is empty',
        build: () => AddressSelectionBloc(placesRepository: placesRepository),
        wait: const Duration(milliseconds: 400),
        act: (bloc) => bloc.add(const SearchTextChanged(
          languageCode: 'en',
          text: '',
        )),
        expect: () => <AddressSelectionState>[],
      );

      blocTest<AddressSelectionBloc, AddressSelectionState>(
        'emits updated state with address suggestions'
        'when SearchTextChanged is added.',
        build: () => AddressSelectionBloc(placesRepository: placesRepository),
        wait: const Duration(milliseconds: 400),
        setUp: () => when(
          () => placesRepository.getAddressSuggestions(
            query: any(named: 'query'),
            language: any(named: 'language'),
            sessionToken: any(named: 'sessionToken'),
          ),
        ).thenAnswer((_) => Future.value(addressSuggestions)),
        act: (bloc) => bloc.add(const SearchTextChanged(
          languageCode: 'en',
          text: 'new york',
        )),
        expect: () => <AddressSelectionState>[
          AddressSelectionState.loading(),
          AddressSelectionState.hasSuggestions(addressSuggestions),
        ],
      );

      blocTest<AddressSelectionBloc, AddressSelectionState>(
        'emits error state if the repository throws an exception',
        build: () => AddressSelectionBloc(placesRepository: placesRepository),
        wait: const Duration(milliseconds: 400),
        setUp: () => when(
          () => placesRepository.getAddressSuggestions(
            query: any(named: 'query'),
            language: any(named: 'language'),
            sessionToken: any(named: 'sessionToken'),
          ),
        ).thenThrow(Exception()),
        act: (bloc) => bloc.add(const SearchTextChanged(
          languageCode: 'en',
          text: 'new york',
        )),
        expect: () => <AddressSelectionState>[
          AddressSelectionState.loading(),
          AddressSelectionState.error(),
        ],
      );
    });
  });
}
