import 'package:flutter/material.dart';

class PlaceDTO {
  final double latitude;
  final double longitude;

  PlaceDTO({
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
    final double _latitude = double.parse(json['latitude']);
    final double _longitude = double.parse(json['longitude']);

    return PlaceDTO(
      latitude: _latitude,
      longitude: _longitude,
    );
  }
}
