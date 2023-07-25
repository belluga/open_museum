import 'package:open_museum/domain/appwrite/value_objects/appwrite_object_id_value.dart';
import 'package:open_museum/domain/dto/place_dto.dart';
import 'package:open_museum/domain/place/value_objects/latitude_value.dart';
import 'package:open_museum/domain/place/value_objects/longitude_value.dart';

class PlaceModel {
  final AppwriteObjectIDValue objectIDValue;
  final LatitudeValue latitudeValue;
  final LongitudeValue longitudeValue;

  PlaceModel({
    required this.latitudeValue,
    required this.longitudeValue,
    required this.objectIDValue,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      PlaceModel.fromDTO(PlaceDTO.fromJson(json));

  factory PlaceModel.fromDTO(PlaceDTO dto) {
    final _objectIDValue = AppwriteObjectIDValue()..doParse(dto.id);
    final _latitudeValue = LatitudeValue(defaultValue: dto.latitude)
      ..validate(dto.latitude.toString());
    final _longitudeValue = LongitudeValue(defaultValue: dto.longitude)
      ..validate(dto.longitude.toString());

    return PlaceModel(
      objectIDValue: _objectIDValue,
      latitudeValue: _latitudeValue,
      longitudeValue: _longitudeValue,
    );
  }
}
