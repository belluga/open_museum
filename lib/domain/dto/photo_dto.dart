import 'package:flutter/material.dart';

class PhotoDTO {
  final DateTime createdAt;
  final Uri url;
  final String? description;

  PhotoDTO({
    required this.url,
    required this.createdAt,
    this.description,
  });

  static PhotoDTO? fromJsonTry(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    try {
      return PhotoDTO.fromJson(json);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return null;
    }
  }

  factory PhotoDTO.fromJson(Map<String, dynamic> json) {
    final DateTime _createdAt = DateTime.parse(json["created_at"]);
    final Uri _url = Uri.parse(json["url"]);
    final String? _description = json['description'];

    return PhotoDTO(
      createdAt: _createdAt,
      url: _url,
      description: _description,
    );
  }
}
