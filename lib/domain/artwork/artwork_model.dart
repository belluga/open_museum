import 'package:open_museum/domain/artwork/value_objects/artwork_description_value.dart';
import 'package:open_museum/domain/artwork/value_objects/artwork_distance_value.dart';
import 'package:open_museum/domain/artwork/value_objects/artwork_name_value.dart';
import 'package:open_museum/domain/appwrite/value_objects/appwrite_object_id_value.dart';
import 'package:open_museum/domain/artists/artist_model.dart';
import 'package:open_museum/domain/artwork/value_objects/artwork_photo_value.dart';
import 'package:open_museum/domain/dto/artwork_dto.dart';
import 'package:open_museum/domain/place/place_model.dart';

class ArtWorkModel {
  final AppwriteObjectIDValue objectIDValue;
  final ArtworkNameValue nameValue;
  final ArtworkDescriptionValue descriptionValue;
  final ArtworkDistanceValue distanceValue;
  final List<ArtistModel> artists;
  final List<ArtworkPhotoValue> photos;
  final PlaceModel place;

  ArtWorkModel({
    required this.objectIDValue,
    required this.nameValue,
    required this.distanceValue,
    required this.descriptionValue,
    required this.artists,
    required this.photos,
    required this.place,
  });

  factory ArtWorkModel.fromJson(Map<String, dynamic> json) =>
      ArtWorkModel.fromDTO(ArtworkDTO.fromJson(json));

  factory ArtWorkModel.fromDTO(ArtworkDTO dto) {
    return ArtWorkModel(
      objectIDValue: AppwriteObjectIDValue()..parse(dto.id),
      nameValue: ArtworkNameValue()..parse(dto.name),
      distanceValue: ArtworkDistanceValue(defaultValue: dto.distance),
      descriptionValue: ArtworkDescriptionValue()..tryParse(dto.description),
      artists: dto.authors.map((dto) => ArtistModel.fromDTO(dto)).toList(),
      photos: dto.photos.map((dto) => ArtworkPhotoValue()..parse(dto)).toList(),
      place: PlaceModel.fromDTO(dto.place),
    );
  }
}
