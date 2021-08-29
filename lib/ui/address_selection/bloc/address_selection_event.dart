part of 'address_selection_bloc.dart';

@immutable
abstract class AddressSelectionEvent extends Equatable {
  const AddressSelectionEvent();
}

@immutable
class SearchTextChanged extends AddressSelectionEvent {
  const SearchTextChanged({
    required this.languageCode,
    required this.text,
  });

  final String languageCode;
  final String text;

  @override
  List<Object?> get props => [languageCode, text];
}
