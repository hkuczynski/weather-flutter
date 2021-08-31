import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/repositories/places_repository.dart';
import 'package:weather/ui/address_selection/bloc/address_selection_bloc.dart';
import 'package:weather/ui/address_selection/widgets/address_selection_view.dart';

class AddressSelectionPage extends StatelessWidget {
  const AddressSelectionPage({Key? key}) : super(key: key);

  static PageRoute get route {
    return MaterialPageRoute(
      builder: (context) => const AddressSelectionPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressSelectionBloc(
        placesRepository: context.read<PlacesRepository>(),
      ),
      child: const AddressSelectionView(),
    );
  }
}
