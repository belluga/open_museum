import 'package:flutter/material.dart';
import 'package:open_museum/domain/dto/artwork_dto.dart';

class PlaceDTO {
  final String id;
  final double latitude;
  final double longitude;
  final List<ArtworkDTO> artworks;

  PlaceDTO({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.artworks,
  });

  static PlaceDTO? fromJsonTry(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    try {
      return PlaceDTO.fromJson(json);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return null;
    }
  }

  factory PlaceDTO.fromJson(Map<String, dynamic> json) {
    final String _id = json["_id"];
    final double _latitude = json['latitude'] ?? json['data']?['latitude'];
    final double _longitude = json['longitude'] ?? json['data']?['longitude'];
    final List<ArtworkDTO> _artworks =
        ArtworkDTO.fromJsonListTry(json["data"]?["authors"]);

    return PlaceDTO(
      id: _id,
      latitude: _latitude,
      longitude: _longitude,
      artworks: _artworks,
    );
  }
}
