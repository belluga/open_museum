import 'package:flutter/material.dart';

class SocialNetworkDTO {
  final String type;
  final String username;

  SocialNetworkDTO({
    required this.type,
    required this.username,
  });

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
    final String _username = json["username"];
    final String _type = json["type"];

    return SocialNetworkDTO(
      username: _username,
      type: _type,
    );
  }
}
