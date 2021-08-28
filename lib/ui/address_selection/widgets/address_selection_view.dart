import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/models/address_suggestion.dart';
import 'package:weather/ui/address_selection/bloc/address_selection_bloc.dart';

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
                delegate: AddressSearchDelegate(
                  addressSelectionBloc:
                      BlocProvider.of<AddressSelectionBloc>(context),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AddressSearchDelegate extends SearchDelegate<AddressSuggestion?> {
  AddressSearchDelegate({required this.addressSelectionBloc});

  final Bloc<AddressSelectionEvent, AddressSelectionState> addressSelectionBloc;

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
    final event = SearchTextChanged(text: query);
    addressSelectionBloc.add(event);

    return BlocBuilder(
      bloc: addressSelectionBloc,
      builder: (BuildContext context, AddressSelectionState state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.hasError) {
          return Text('Error loading suggestions');
        }

        return ListView.builder(
          itemCount: state.suggestions.addressSuggestions.length,
          itemBuilder: (context, index) {
            final suggestion = state.suggestions.addressSuggestions[index];

            return ListTile(
              title: Text(suggestion.description),
              onTap: () {
                close(context, suggestion);
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final event = SearchTextChanged(text: query);
    addressSelectionBloc.add(event);

    return BlocBuilder(
      bloc: addressSelectionBloc,
      builder: (BuildContext context, AddressSelectionState state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.hasError) {
          return Text('Error loading suggestions');
        }

        return ListView.builder(
          itemCount: state.suggestions.addressSuggestions.length,
          itemBuilder: (context, index) {
            final suggestion = state.suggestions.addressSuggestions[index];

            return ListTile(
              title: Text(suggestion.description),
              onTap: () {
                close(context, suggestion);
              },
            );
          },
        );
      },
    );
  }
}
