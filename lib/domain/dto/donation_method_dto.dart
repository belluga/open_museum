import 'package:flutter/material.dart';

class DonationMethodDTO {
  final String id;
  final String type;
  final String key;
  final String? keyType;

  DonationMethodDTO({
    required this.id,
    required this.type,
    required this.key,
    this.keyType,
  });

  static List<DonationMethodDTO> fromJsonListTry(List? jsonList) {
    if (jsonList == null || jsonList.isEmpty) {
      return List<DonationMethodDTO>.empty();
    }

    try {
      return jsonList.map((e) => DonationMethodDTO.fromJson(e)).toList();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return List<DonationMethodDTO>.empty();
    }
  }

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
    final String _id = json["_id"];
    final String _key = json["key"] ?? json['data']["key"];
    final String _type = json["type"] ?? json['data']["type"];
    final String? _keyType = json["key_type"] ?? json['data']["key_type"];

    return DonationMethodDTO(
      id: _id,
      key: _key,
      type: _type,
      keyType: _keyType,
    );
  }
}
