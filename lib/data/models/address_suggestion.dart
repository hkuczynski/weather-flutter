class AddressSuggestion {
  const AddressSuggestion({
    required this.description,
    this.mainText,
    this.secondaryText,
  });

  final String description;
  final String? mainText;
  final String? secondaryText;

  String get name => secondaryText ?? description;
}
