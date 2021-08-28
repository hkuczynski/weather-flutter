import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/ui/address_selection/bloc/address_selection_bloc.dart';
import 'package:weather/ui/address_selection/widgets/address_selection_view.dart';

class AddressSelectionPage extends StatelessWidget {
  const AddressSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressSelectionBloc(
        placesRepository: RepositoryProvider.of(context),
      ),
      child: const AddressSelectionView(),
    );
  }
}
