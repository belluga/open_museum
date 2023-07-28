import 'package:flutter/material.dart';
import 'package:open_museum/domain/dto/artists_dto.dart';

class ArtworkDTO {
  final String id;
  final String name;
  final double distance;
  final List<ArtistDTO> authors;
  final List<String> photos;
  final String? description;

  ArtworkDTO({
    required this.id,
    required this.name,
    required this.photos,
    required this.authors,
    required this.distance,
    this.description,
  });

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

    return ArtworkDTO(
      id: _id,
      name: _name,
      description: _description,
      photos: _photos,
      authors: _authors,
      distance: _distance,
    );
  }
}
