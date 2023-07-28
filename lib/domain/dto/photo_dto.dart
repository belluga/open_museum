import 'package:flutter/material.dart';

class PhotoDTO {
  final String id;
  final DateTime createdAt;
  final Uri url;
  final String? description;

  PhotoDTO({
    required this.id,
    required this.url,
    required this.createdAt,
    this.description,
  });

  static List<PhotoDTO> fromJsonListTry(List? jsonList) {
    if (jsonList == null || jsonList.isEmpty) {
      return List<PhotoDTO>.empty();
    }

    try {
      return jsonList.map((e) => PhotoDTO.fromJson(e)).toList();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return List<PhotoDTO>.empty();
    }
  }

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
    final String _id = json["_id"];
    final DateTime _createdAt = DateTime.parse(json["\$createdAt"]);
    final Uri _url = Uri.parse(json["url"] ?? json['data']["url"]);
    final String? _description = json['description'] ?? json['data']["description"];

    return PhotoDTO(
      id: _id,
      createdAt: _createdAt,
      url: _url,
      description: _description,
    );
  }
}
