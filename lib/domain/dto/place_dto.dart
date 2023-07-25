import 'package:flutter/material.dart';

class PlaceDTO {
  final String id;
  final double latitude;
  final double longitude;

  PlaceDTO({
    required this.id,
    required this.latitude,
    required this.longitude,
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
    final String _id = json["\$id"];
    final double _latitude = json['latitude'] ?? json['data']['latitude'];
    final double _longitude = json['longitude'] ?? json['data']['longitude'];

    return PlaceDTO(
      id: _id,
      latitude: _latitude,
      longitude: _longitude,
    );
  }
}
