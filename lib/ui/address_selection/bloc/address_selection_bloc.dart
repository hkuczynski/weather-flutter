import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'address_selection_event.dart';
part 'address_selection_state.dart';

class AddressSelectionBloc
    extends Bloc<AddressSelectionEvent, AddressSelectionState> {
  AddressSelectionBloc() : super(AddressSelectionState());

  @override
  Stream<AddressSelectionState> mapEventToState(
    AddressSelectionEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
