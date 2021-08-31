import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/models/address_suggestion.dart';
import 'package:weather/l10n/l10n.dart';
import 'package:weather/ui/address_selection/bloc/address_selection_bloc.dart';

class AddressSelectionView extends StatelessWidget {
  const AddressSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.addressSelectionAppBarTitle),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSearch(
            context: context,
            delegate: AddressSearchDelegate(
              addressSelectionBloc:
                  BlocProvider.of<AddressSelectionBloc>(context),
            ),
          );
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}

class AddressSearchDelegate extends SearchDelegate<AddressSuggestion?> {
  AddressSearchDelegate({required this.addressSelectionBloc});

  final Bloc<AddressSelectionEvent, AddressSelectionState> addressSelectionBloc;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const BackButtonIcon(),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) => buildSuggestions(context);

  @override
  Widget buildSuggestions(BuildContext context) {
    final event = SearchTextChanged(
      languageCode: Localizations.localeOf(context).languageCode,
      text: query,
    );
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
          return Text(context.l10n.addressSelectionLoadingErrorText);
        }

        return ListView.builder(
          itemCount: state.suggestions.addressSuggestions.length,
          itemBuilder: (context, index) {
            final suggestion = state.suggestions.addressSuggestions[index];

            return ListTile(
              title: Text(suggestion.description),
              onTap: () {
                close(context, suggestion);
                Navigator.of(context).pop(suggestion);
              },
            );
          },
        );
      },
    );
  }
}
