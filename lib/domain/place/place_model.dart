import 'package:open_museum/domain/place/value_objects/latitude_value.dart';
import 'package:open_museum/domain/place/value_objects/longitude_value.dart';

class PlaceModel {
  final LatitudeValue latitudeValue;
  final LongitudeValue longitudeValue;

  PlaceModel({
    required this.latitudeValue,
    required this.longitudeValue,
  });
}
