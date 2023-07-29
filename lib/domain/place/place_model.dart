import 'package:open_museum/domain/dto/place_dto.dart';
import 'package:open_museum/domain/place/value_objects/latitude_value.dart';
import 'package:open_museum/domain/place/value_objects/longitude_value.dart';

class PlaceModel {
  final LatitudeValue latitudeValue;
  final LongitudeValue longitudeValue;

  PlaceModel({
    required this.latitudeValue,
    required this.longitudeValue,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      PlaceModel.fromDTO(PlaceDTO.fromJson(json));

  factory PlaceModel.fromDTO(PlaceDTO dto) {
    final _latitudeValue = LatitudeValue(defaultValue: dto.latitude)
      ..parse(dto.latitude.toString());
    final _longitudeValue = LongitudeValue(defaultValue: dto.longitude)
      ..parse(dto.longitude.toString());

    return PlaceModel(
      latitudeValue: _latitudeValue,
      longitudeValue: _longitudeValue,
    );
  }
}
