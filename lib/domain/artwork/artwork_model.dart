import 'package:open_museum/domain/artwork/value_objects/artwork_description_value.dart';
import 'package:open_museum/domain/artwork/value_objects/artwork_distance_value.dart';
import 'package:open_museum/domain/artwork/value_objects/artwork_name_value.dart';
import 'package:open_museum/domain/appwrite/value_objects/appwrite_object_id_value.dart';
import 'package:open_museum/domain/artists/artist_model.dart';
import 'package:open_museum/domain/artwork/value_objects/artwork_photo_value.dart';
import 'package:open_museum/domain/dto/artwork_dto.dart';

class ArtWorkModel {
  final AppwriteObjectIDValue objectIDValue;
  final ArtworkNameValue nameValue;
  final ArtworkDescriptionValue descriptionValue;
  final ArtworkDistanceValue distanceValue;
  final List<ArtistModel> authors;
  final List<ArtworkPhotoValue> photos;

  ArtWorkModel({
    required this.objectIDValue,
    required this.nameValue,
    required this.distanceValue,
    required this.descriptionValue,
    required this.authors,
    required this.photos,
  });

  factory ArtWorkModel.fromJson(Map<String, dynamic> json) =>
      ArtWorkModel.fromDTO(ArtworkDTO.fromJson(json));

  factory ArtWorkModel.fromDTO(ArtworkDTO dto) {
    return ArtWorkModel(
      objectIDValue: AppwriteObjectIDValue()..parse(dto.id),
      nameValue: ArtworkNameValue()..parse(dto.name),
      distanceValue: ArtworkDistanceValue(defaultValue: dto.distance),
      descriptionValue: ArtworkDescriptionValue()..tryParse(dto.description),
      authors: dto.authors.map((dto) => ArtistModel.fromDTO(dto)).toList(),
      photos: dto.photos.map((dto) => ArtworkPhotoValue()..parse(dto)).toList(),
    );
  }
}
