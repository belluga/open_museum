import 'package:flutter/material.dart';
import 'package:open_museum/domain/dto/external_link_dto.dart';
import 'package:open_museum/domain/external_links/enum/external_link_types.dart';
import 'package:open_museum/domain/external_links/value_objects/external_link_type_value.dart';
import 'package:open_museum/domain/external_links/value_objects/external_link_url.dart';
import 'package:open_museum/domain/external_links/value_objects/external_link_username_value.dart';

class ExternalLinkModel {
  final ExternalLinkTypeValue typeValue;
  final ExternalLinkUsernameValue usernameValue;
  final ExternalLinkUrlValue urlValue;

  ExternalLinkModel({
    required this.typeValue,
    required this.usernameValue,
    required this.urlValue,
  });

  IconData get iconData {
    switch (typeValue.value) {
      case ExternalLinkTypes.facebook:
        return Icons.facebook;
      case ExternalLinkTypes.pinterest:
        return Icons.pin;
      case ExternalLinkTypes.instagram:
        return Icons.camera_alt_outlined;
      case ExternalLinkTypes.whatsapp:
        return Icons.whatshot;
      case ExternalLinkTypes.website:
        return Icons.link;
      case ExternalLinkTypes.store:
        return Icons.store;
    }
  }

  Uri get url {
    switch (typeValue.value) {
      case ExternalLinkTypes.facebook:
        return Uri.parse("https://facebook.com/${usernameValue.value}");
      case ExternalLinkTypes.pinterest:
        return Uri.parse("https://pinterest.com/${usernameValue.value}");
      case ExternalLinkTypes.instagram:
        return Uri.parse("https://instagram.com/${usernameValue.value}");
      case ExternalLinkTypes.whatsapp:
        return Uri.parse(
            "https://api.whatsapp.com/send?phone=${usernameValue.value.replaceFirst("+", "")}");
      case ExternalLinkTypes.website:
        return urlValue.value!;
      case ExternalLinkTypes.store:
        return urlValue.value!;
    }
  }

  factory ExternalLinkModel.fromJson(Map<String, dynamic> json) =>
      ExternalLinkModel.fromDTO(ExternalLinkDTO.fromJson(json));

  factory ExternalLinkModel.fromDTO(ExternalLinkDTO dto) {
    final _typeValue = ExternalLinkTypeValue()..parse(dto.type);
    final _usernameValue = ExternalLinkUsernameValue()..tryParse(dto.username);
    final _urlValue = ExternalLinkUrlValue()..tryParse(dto.url);

    return ExternalLinkModel(
      typeValue: _typeValue,
      usernameValue: _usernameValue,
      urlValue: _urlValue,
    );
  }
}
