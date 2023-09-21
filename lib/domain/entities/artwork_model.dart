import 'package:open_museum/domain/value_objects/artwork/artwork_description_value.dart';
import 'package:open_museum/domain/value_objects/artwork/artwork_distance_value.dart';
import 'package:open_museum/domain/value_objects/artwork/artwork_name_value.dart';
import 'package:open_museum/domain/value_objects/shared/object_id_value.dart';
import 'package:open_museum/domain/entities/artist_model.dart';
import 'package:open_museum/domain/value_objects/artwork/artwork_photo_value.dart';
import 'package:open_museum/domain/entities/place_model.dart';

class ArtWorkModel {
  final ObjectIDValue objectIDValue;
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
}
