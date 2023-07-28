import 'package:flutter/material.dart';
import 'package:open_museum/domain/dto/donation_method_dto.dart';
import 'package:open_museum/domain/dto/social_network_dto.dart';

class ArtistDTO {
  final String id;
  final String name;
  final String? alias;
  final String? bio;
  final String? website;
  final String? store;
  final String? avatar;
  final List<DonationMethodDTO> donationMethods;
  final List<SocialNetworkDTO> socialNetworks;

  ArtistDTO({
    required this.id,
    required this.name,
    required this.donationMethods,
    required this.socialNetworks,
    this.alias,
    this.bio,
    this.website,
    this.store,
    this.avatar,
  });

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

    final List<SocialNetworkDTO> _socialNetworks =
        SocialNetworkDTO.fromJsonListTry(json["socialNetworks"]);

    return ArtistDTO(
      id: _id,
      name: _name,
      alias: _alias,
      bio: _bio,
      donationMethods: _donationMethods,
      socialNetworks: _socialNetworks,
      website: _website,
      store: _store,
      avatar: _avatar,
    );
  }
}
