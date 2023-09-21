import 'package:open_museum/domain/value_objects/place/latitude_value.dart';
import 'package:open_museum/domain/value_objects/place/longitude_value.dart';

class PlaceModel {
  final LatitudeValue latitudeValue;
  final LongitudeValue longitudeValue;

  PlaceModel({
    required this.latitudeValue,
    required this.longitudeValue,
  });
}
