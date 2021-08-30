import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';
import 'package:weather/data/models/address_suggestions.dart';
import 'package:weather/data/repositories/places_repository.dart';

part 'address_selection_event.dart';
part 'address_selection_state.dart';

class AddressSelectionBloc
    extends Bloc<AddressSelectionEvent, AddressSelectionState> {
  AddressSelectionBloc({
    required PlacesRepository placesRepository,
    String? sessionToken,
  })  : _placesRepository = placesRepository,
        _sessionToken = sessionToken ?? const Uuid().v4(),
        super(AddressSelectionState.initial());

  final PlacesRepository _placesRepository;
  final String _sessionToken;

  @override
  Stream<Transition<AddressSelectionEvent, AddressSelectionState>>
      transformEvents(Stream<AddressSelectionEvent> events, transitionFn) {
    return events
        .distinct()
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap((transitionFn));
  }

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
    if (event.text.isEmpty) return;

    yield AddressSelectionState.loading();

    try {
      final suggestions = await _placesRepository.getAddressSuggestions(
        query: event.text,
        language: event.languageCode,
        sessionToken: _sessionToken,
      );

      yield AddressSelectionState.hasSuggestions(suggestions);
    } catch (exception) {
      yield AddressSelectionState.error();
    }
  }
}
