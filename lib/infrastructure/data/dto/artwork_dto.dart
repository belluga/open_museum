import 'package:flutter/material.dart';
import 'package:open_museum/domain/appwrite/value_objects/appwrite_object_id_value.dart';
import 'package:open_museum/domain/artwork/artwork_model.dart';
import 'package:open_museum/domain/artwork/value_objects/artwork_description_value.dart';
import 'package:open_museum/domain/artwork/value_objects/artwork_distance_value.dart';
import 'package:open_museum/domain/artwork/value_objects/artwork_name_value.dart';
import 'package:open_museum/domain/artwork/value_objects/artwork_photo_value.dart';
import 'package:open_museum/infrastructure/data/dto/artists_dto.dart';
import 'package:open_museum/infrastructure/data/dto/place_dto.dart';

class ArtworkDTO {
  final String id;
  final String name;
  final double distance;
  final List<ArtistDTO> authors;
  final List<String> photos;
  final String? description;
  final PlaceDTO place;

  ArtworkDTO({
    required this.id,
    required this.name,
    required this.photos,
    required this.authors,
    required this.distance,
    required this.place,
    this.description,
  });

  ArtWorkModel toDomain() {
    return ArtWorkModel(
      objectIDValue: AppwriteObjectIDValue()..parse(id),
      nameValue: ArtworkNameValue()..parse(name),
      distanceValue: ArtworkDistanceValue(defaultValue: distance),
      descriptionValue: ArtworkDescriptionValue()..tryParse(description),
      artists: authors.map((dto) => dto.toDomain()).toList(),
      photos: photos.map((dto) => ArtworkPhotoValue()..parse(dto)).toList(),
      place: place.toDomain(),
    );
  }

  static List<ArtworkDTO> fromJsonListTry(List? jsonList) {
    if (jsonList == null || jsonList.isEmpty) {
      return List<ArtworkDTO>.empty();
    }

    try {
      return jsonList.map((e) => ArtworkDTO.fromJson(e)).toList();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return List<ArtworkDTO>.empty();
    }
  }

  static ArtworkDTO? fromJsonTry(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    try {
      return ArtworkDTO.fromJson(json);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return null;
    }
  }

  factory ArtworkDTO.fromJson(Map<String, dynamic> json) {
    final String _id = json["_id"];
    final String _name = json['name'] ?? json['data']['name'];
    final double _distance = json['distance'] ?? json['data']['distance'];
    final String? _description =
        json['description'] ?? json['data']['description'];

    final List<String> _photos =
        (json["photos"] as List).map((item) => item as String).toList();
    final List<ArtistDTO> _authors = ArtistDTO.fromJsonListTry(json["artists"]);
    final PlaceDTO _place = PlaceDTO.fromJson(json["location"]);

    return ArtworkDTO(
      id: _id,
      name: _name,
      description: _description,
      photos: _photos,
      authors: _authors,
      distance: _distance,
      place: _place,
    );
  }
}
