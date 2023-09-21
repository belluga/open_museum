import 'package:flutter/material.dart';
import 'package:open_museum/domain/entities/place_model.dart';
import 'package:open_museum/domain/value_objects/place/latitude_value.dart';
import 'package:open_museum/domain/value_objects/place/longitude_value.dart';

class PlaceDTO {
  final double latitude;
  final double longitude;

  PlaceDTO({
    required this.latitude,
    required this.longitude,
  });

  PlaceModel toDomain() {
    final _latitudeValue = LatitudeValue(defaultValue: latitude)
      ..parse(latitude.toString());
    final _longitudeValue = LongitudeValue(defaultValue: longitude)
      ..parse(longitude.toString());

    return PlaceModel(
      latitudeValue: _latitudeValue,
      longitudeValue: _longitudeValue,
    );
  }

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
    final List<double> _coordinates =
        (json["coordinates"] as List).map((e) => e as double).toList();

    final double _latitude = _coordinates[0];
    final double _longitude = _coordinates[1];

    return PlaceDTO(
      latitude: _latitude,
      longitude: _longitude,
    );
  }
}
