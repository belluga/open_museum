import 'package:flutter/material.dart';
import 'package:open_museum/domain/entities/external_link_model.dart';
import 'package:open_museum/domain/value_objects/external_link/external_link_type_value.dart';
import 'package:open_museum/domain/value_objects/external_link/external_link_url.dart';
import 'package:open_museum/domain/value_objects/external_link/external_link_username_value.dart';

class ExternalLinkDTO {
  final String type;
  final String? username;
  final String? url;

  ExternalLinkDTO({
    required this.type,
    this.username,
    this.url,
  }) : assert(username != null || url != null,
            "Either username or url should not be null.");

  ExternalLinkModel toDomain() {
    final _typeValue = ExternalLinkTypeValue()..parse(type);
    final _usernameValue = ExternalLinkUsernameValue()..tryParse(username);
    final _urlValue = ExternalLinkUrlValue()..tryParse(url);

    return ExternalLinkModel(
      typeValue: _typeValue,
      usernameValue: _usernameValue,
      urlValue: _urlValue,
    );
  }

  static List<ExternalLinkDTO> fromJsonListTry(List? jsonList) {
    if (jsonList == null || jsonList.isEmpty) {
      return List<ExternalLinkDTO>.empty();
    }

    try {
      return jsonList.map((e) => ExternalLinkDTO.fromJson(e)).toList();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return List<ExternalLinkDTO>.empty();
    }
  }

  static ExternalLinkDTO? fromJsonTry(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    try {
      return ExternalLinkDTO.fromJson(json);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return null;
    }
  }

  factory ExternalLinkDTO.fromJson(Map<String, dynamic> json) {
    final String? _username = json["key"];
    final String? _url = json["url"];
    final String _type = json["type"];

    return ExternalLinkDTO(username: _username, type: _type, url: _url);
  }
}
