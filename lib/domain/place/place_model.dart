import 'package:open_museum/domain/appwrite/value_objects/appwrite_object_id_value.dart';
import 'package:open_museum/domain/artwork/artwork_model.dart';
import 'package:open_museum/domain/dto/place_dto.dart';
import 'package:open_museum/domain/place/value_objects/latitude_value.dart';
import 'package:open_museum/domain/place/value_objects/longitude_value.dart';

class PlaceModel {
  final AppwriteObjectIDValue objectIDValue;
  final LatitudeValue latitudeValue;
  final LongitudeValue longitudeValue;
  final List<ArtWorkModel> artworks;

  PlaceModel({
    required this.latitudeValue,
    required this.longitudeValue,
    required this.objectIDValue,
    required this.artworks,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      PlaceModel.fromDTO(PlaceDTO.fromJson(json));

  factory PlaceModel.fromDTO(PlaceDTO dto) {
    final _objectIDValue = AppwriteObjectIDValue()..parse(dto.id);
    final _latitudeValue = LatitudeValue(defaultValue: dto.latitude)
      ..parse(dto.latitude.toString());
    final _longitudeValue = LongitudeValue(defaultValue: dto.longitude)
      ..parse(dto.longitude.toString());

    final List<ArtWorkModel> _artworks =
        dto.artworks.map((dto) => ArtWorkModel.fromDTO(dto)).toList();

    return PlaceModel(
      objectIDValue: _objectIDValue,
      latitudeValue: _latitudeValue,
      longitudeValue: _longitudeValue,
      artworks: _artworks,
    );
  }
}
