import 'package:flutter/material.dart';
import 'package:open_museum/domain/artwork/value_objects/artwork_description_value.dart';
import 'package:open_museum/domain/artwork/value_objects/artwork_name_value.dart';
import 'package:open_museum/domain/appwrite/value_objects/appwrite_object_id_value.dart';
import 'package:open_museum/domain/author/author_model.dart';
import 'package:open_museum/domain/dto/artwork_dto.dart';
import 'package:open_museum/domain/photo/photo_model.dart';
import 'package:open_museum/domain/place/place_model.dart';

class ArtWorkModel {
  final AppwriteObjectIDValue objectIDValue;
  final ArtworkNameValue nameValue;
  final ArtworkDescriptionValue descriptionValue;
  final PlaceModel? place;
  final List<AuthorModel> authors;
  final List<PhotoModel> photos;

  ArtWorkModel({
    required this.objectIDValue,
    required this.nameValue,
    required this.descriptionValue,
    required this.place,
    required this.authors,
    required this.photos,
  });

  factory ArtWorkModel.fromJson(Map<String, dynamic> json) =>
      ArtWorkModel.fromDTO(ArtworkDTO.fromJson(json));

  factory ArtWorkModel.fromDTO(ArtworkDTO dto) {
    PlaceModel? _place;
    try {
      _place = PlaceModel.fromDTO(dto.place!);
    } catch (e) {
      debugPrint("Don't have place");
    }

    return ArtWorkModel(
      objectIDValue: AppwriteObjectIDValue()..doParse(dto.id),
      nameValue: ArtworkNameValue()..doParse(dto.name),
      descriptionValue: ArtworkDescriptionValue()..tryParse(dto.description),
      place: _place,
      authors: dto.authors.map((dto) => AuthorModel.fromDTO(dto)).toList(),
      photos: dto.photos.map((dto) => PhotoModel.fromDTO(dto)).toList(),
    );
  }
}
