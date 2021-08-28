import 'package:flutter/material.dart';

class AddressSelectionView extends StatefulWidget {
  const AddressSelectionView({Key? key}) : super(key: key);

  @override
  _AddressSelectionViewState createState() => _AddressSelectionViewState();
}

class _AddressSelectionViewState extends State<AddressSelectionView> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            onTap: () {
              showSearch(
                context: context,
                delegate: AddressSearchDelegate(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AddressSearchDelegate extends SearchDelegate<AddressSuggestion?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("Results");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text("Suggestions");
  }
}

class AddressSuggestion {}
