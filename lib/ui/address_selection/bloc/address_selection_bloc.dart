import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:weather/data/models/address_suggestions.dart';
import 'package:weather/data/repositories/places_repository.dart';

part 'address_selection_event.dart';
part 'address_selection_state.dart';

class AddressSelectionBloc
    extends Bloc<AddressSelectionEvent, AddressSelectionState> {
  AddressSelectionBloc({
    required PlacesRepository placesRepository,
  })  : _placesRepository = placesRepository,
        super(AddressSelectionState.initial());

  final PlacesRepository _placesRepository;

  @override
  Stream<AddressSelectionState> mapEventToState(
    AddressSelectionEvent event,
  ) async* {
    if (event is SearchTextChanged) {
      yield* _mapSearchTextChangedEvent(event, state);
    }
  }

  Stream<AddressSelectionState> _mapSearchTextChangedEvent(
    SearchTextChanged event,
    AddressSelectionState state,
  ) async* {
    yield AddressSelectionState.loading();

    try {
      final suggestions = await _placesRepository.getAddressSuggestions(
        query: event.text,
      );

      yield AddressSelectionState.hasSuggestions(suggestions);
    } catch (exception) {
      yield AddressSelectionState.error();
    }
  }
}
