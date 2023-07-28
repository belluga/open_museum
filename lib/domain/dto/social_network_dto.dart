import 'package:flutter/material.dart';

class SocialNetworkDTO {
  final String id;
  final String type;
  final String username;

  SocialNetworkDTO({
    required this.id,
    required this.type,
    required this.username,
  });

  static List<SocialNetworkDTO> fromJsonListTry(List? jsonList) {
    if (jsonList == null || jsonList.isEmpty) {
      return List<SocialNetworkDTO>.empty();
    }

    try {
      return jsonList.map((e) => SocialNetworkDTO.fromJson(e)).toList();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return List<SocialNetworkDTO>.empty();
    }
  }

  static SocialNetworkDTO? fromJsonTry(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    try {
      return SocialNetworkDTO.fromJson(json);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return null;
    }
  }

  factory SocialNetworkDTO.fromJson(Map<String, dynamic> json) {
    final String _id = json["_id"];
    final String _username = json["username"] ?? json['data']["username"];
    final String _type = json["type"]?? json['data']["type"];

    return SocialNetworkDTO(
      id: _id,
      username: _username,
      type: _type,
    );
  }
}
