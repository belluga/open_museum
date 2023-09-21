import 'package:flutter/material.dart';
import 'package:open_museum/domain/entities/donation_method_model.dart';
import 'package:open_museum/domain/value_objects/donation_method/donation_method_key_type_value.dart';
import 'package:open_museum/domain/value_objects/donation_method/donation_method_key_value.dart';
import 'package:open_museum/domain/value_objects/donation_method/donation_method_type_value.dart';

class DonationMethodDTO {
  final String type;
  final String key;
  final String? keyType;

  DonationMethodDTO({
    required this.type,
    required this.key,
    this.keyType,
  });

  DonationMethodModel toDomain() {
    final _typeValue = DonationMethodTypeValue(defaultValue: null)
      ..tryParse(type);
    final _keyTypeValue = DonationMethodKeyTypeValue(defaultValue: null)
      ..tryParse(keyType);
    final _keyValue = DonationMethodKeyValue()..tryParse(key);

    return DonationMethodModel(
      key: _keyValue,
      keyType: _keyTypeValue,
      typeValue: _typeValue,
    );
  }

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
