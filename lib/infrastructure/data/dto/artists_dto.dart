import 'package:flutter/material.dart';
import 'package:open_museum/domain/appwrite/value_objects/appwrite_object_id_value.dart';
import 'package:open_museum/domain/artists/artist_model.dart';
import 'package:open_museum/domain/artists/value_objects/artist_alias_value.dart';
import 'package:open_museum/domain/artists/value_objects/artist_avatar_value.dart';
import 'package:open_museum/domain/artists/value_objects/artist_bio_value.dart';
import 'package:open_museum/domain/artists/value_objects/artist_name_value.dart';
import 'package:open_museum/infrastructure/data/dto/donation_method_dto.dart';
import 'package:open_museum/infrastructure/data/dto/external_link_dto.dart';

class ArtistDTO {
  final String id;
  final String name;
  final String? alias;
  final String? bio;
  final String? website;
  final String? store;
  final String? avatar;
  final List<DonationMethodDTO> donationMethods;
  final List<ExternalLinkDTO> externalLinks;

  ArtistDTO({
    required this.id,
    required this.name,
    required this.donationMethods,
    required this.externalLinks,
    this.alias,
    this.bio,
    this.website,
    this.store,
    this.avatar,
  });

  ArtistModel toDomain() {
    final _objectIDValue = AppwriteObjectIDValue()..parse(id);
    final _nameValue = ArtistNameValue()..parse(name);
    final _aliasValue = ArtistAliasValue()..tryParse(alias);
    final _avatarValue = ArtistAvatarValue()..tryParse(avatar);
    final _bioValue = ArtistBioValue()..tryParse(bio);
    final _donationMethods =
        donationMethods.map((dto) => dto.toDomain()).toList();
    final _externalLinks = externalLinks.map((dto) => dto.toDomain()).toList();

    return ArtistModel(
        objectIDValue: _objectIDValue,
        bioValue: _bioValue,
        donationMethods: _donationMethods,
        nameValue: _nameValue,
        aliasValue: _aliasValue,
        externalLinks: _externalLinks,
        avatarValue: _avatarValue);
  }

  static List<ArtistDTO> fromJsonListTry(List? jsonList) {
    if (jsonList == null || jsonList.isEmpty) {
      return List<ArtistDTO>.empty();
    }

    try {
      return jsonList.map((e) => ArtistDTO.fromJson(e)).toList();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return List<ArtistDTO>.empty();
    }
  }

  static ArtistDTO? fromJsonTry(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    try {
      return ArtistDTO.fromJson(json);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return null;
    }
  }

  factory ArtistDTO.fromJson(Map<String, dynamic> json) {
    final String _id = json["_id"];
    final String _name = json['name'];
    final String? _alias = json['alias'];
    final String? _bio = json['bio'];
    final String? _website = json['website'];
    final String? _store = json['store'];
    final String? _avatar = json['avatar'];

    final List<DonationMethodDTO> _donationMethods =
        DonationMethodDTO.fromJsonListTry(json["donationMethods"]);

    final List<ExternalLinkDTO> _externalLinks =
        ExternalLinkDTO.fromJsonListTry(json["external_links"]);

    return ArtistDTO(
      id: _id,
      name: _name,
      alias: _alias,
      bio: _bio,
      donationMethods: _donationMethods,
      externalLinks: _externalLinks,
      website: _website,
      store: _store,
      avatar: _avatar,
    );
  }
}
