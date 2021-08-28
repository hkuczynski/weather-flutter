part of 'address_selection_bloc.dart';

@immutable
class AddressSelectionState {
  const AddressSelectionState({
    required this.hasError,
    required this.isLoading,
    required this.suggestions,
  });

  factory AddressSelectionState.initial() {
    return const AddressSelectionState(
      hasError: false,
      isLoading: false,
      suggestions: AddressSuggestions(addressSuggestions: []),
    );
  }

  factory AddressSelectionState.loading() {
    return const AddressSelectionState(
      hasError: false,
      isLoading: true,
      suggestions: AddressSuggestions(addressSuggestions: []),
    );
  }

  factory AddressSelectionState.error() {
    return const AddressSelectionState(
      hasError: true,
      isLoading: false,
      suggestions: AddressSuggestions(addressSuggestions: []),
    );
  }

  factory AddressSelectionState.hasSuggestions(AddressSuggestions suggestions) {
    return AddressSelectionState(
      hasError: false,
      isLoading: false,
      suggestions: suggestions,
    );
  }

  final bool hasError;
  final bool isLoading;
  final AddressSuggestions suggestions;

  AddressSelectionState copyWith({
    bool? hasError,
    bool? isLoading,
    AddressSuggestions? suggestions,
  }) {
    return AddressSelectionState(
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
      suggestions: suggestions ?? this.suggestions,
    );
  }
}
