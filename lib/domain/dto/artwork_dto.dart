import 'package:flutter/material.dart';
import 'package:open_museum/domain/dto/author_dto.dart';
import 'package:open_museum/domain/dto/photo_dto.dart';
import 'package:open_museum/domain/dto/place_dto.dart';

class ArtworkDTO {
  final String name;
  final PlaceDTO? place;
  final String? description;
  final List<AuthorDTO> authors;
  final List<PhotoDTO> photos;

  ArtworkDTO({
    required this.name,
    required this.place,
    required this.photos,
    required this.authors,
    this.description,
  });

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
    final String _name = json['data']['name'];
    final String? _description = json['data']['description'];
    final PlaceDTO? _place = PlaceDTO.fromJsonTry(json['data']["places"]);

    final List<PhotoDTO> _photos =
        (json['data']['photos'] as List).map((e) => PhotoDTO.fromJson(e)).toList();

    final List<AuthorDTO> _authors =
        (json['data']['authors'] as List).map((e) => AuthorDTO.fromJson(e)).toList();

    return ArtworkDTO(
      name: _name,
      description: _description,
      photos: _photos,
      place: _place,
      authors: _authors,
    );
  }
}
