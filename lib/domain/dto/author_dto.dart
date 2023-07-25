import 'package:flutter/material.dart';
import 'package:open_museum/domain/dto/donation_method.dart';
import 'package:open_museum/domain/dto/social_network.dart';

class AuthorDTO {
  final String id;
  final String name;
  final String? bio;
  final String? website;
  final List<DonationMethodDTO> donationMethods;
  final List<SocialNetworkDTO> socialNetworks;

  AuthorDTO({
    required this.id,
    required this.name,
    required this.donationMethods,
    required this.socialNetworks,
    this.bio,
    this.website,
  });

  static List<AuthorDTO> fromJsonListTry(List? jsonList) {
    if (jsonList == null || jsonList.isEmpty) {
      return List<AuthorDTO>.empty();
    }

    try {
      return jsonList.map((e) => AuthorDTO.fromJson(e)).toList();
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return List<AuthorDTO>.empty();
    }
  }

  static AuthorDTO? fromJsonTry(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    try {
      return AuthorDTO.fromJson(json);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return null;
    }
  }

  factory AuthorDTO.fromJson(Map<String, dynamic> json) {
    final String _id = json["\$id"];
    final String _name = json['name'] ?? json['data']['name'];
    final String? _bio = json['bio'] ?? json['data']?['bio'];
    final String? _website = json['website'] ?? json['data']?['website'];

    final List<DonationMethodDTO> _donationMethods =
        DonationMethodDTO.fromJsonListTry(json["data"]?["donationMethods"]);

    final List<SocialNetworkDTO> _socialNetworks =
        SocialNetworkDTO.fromJsonListTry(json["data"]?["socialNetworks"]);

    return AuthorDTO(
      id: _id,
      name: _name,
      bio: _bio,
      donationMethods: _donationMethods,
      socialNetworks: _socialNetworks,
      website: _website,
    );
  }
}
