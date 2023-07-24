import 'package:flutter/material.dart';

class DonationMethodDTO {
  final String type;
  final String key;
  final String? keyType;

  DonationMethodDTO({
    required this.type,
    required this.key,
    this.keyType,
  });

  static DonationMethodDTO? fromJsonTry(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    try {
      return DonationMethodDTO.fromJson(json);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return null;
    }
  }

  factory DonationMethodDTO.fromJson(Map<String, dynamic> json) {
    final String _key = json["key"];
    final String _type = json["type"];
    final String? _keyType = json["key_type"];

    return DonationMethodDTO(
      key: _key,
      type: _type,
      keyType: _keyType,
    );
  }
}
