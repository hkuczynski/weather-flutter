import 'package:weather/data/models/coordinates.dart';

class City {
  const City({
    required this.name,
    required this.coordinates,
  });

  final String name;
  final Coordinates coordinates;
}
