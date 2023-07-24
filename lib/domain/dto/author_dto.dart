import 'package:flutter/material.dart';
import 'package:open_museum/domain/dto/donation_method.dart';
import 'package:open_museum/domain/dto/social_network.dart';

class AuthorDTO {
  final String name;
  final String? bio;
  final String? website;
  final List<DonationMethodDTO> donationMethods;
  final List<SocialNetworkDTO> socialNetworks;

  AuthorDTO({
    required this.name,
    required this.donationMethods,
    required this.socialNetworks,
    this.bio,
    this.website,
  });

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
    final String _name = json['name'];
    final String? _bio = json['bio'];
    final String? _website = json['website'];
    
    final List<DonationMethodDTO> _donationMethods =
        (json['donation_methods'] as List)
            .map((e) => DonationMethodDTO.fromJson(e))
            .toList();

    final List<SocialNetworkDTO> _socialNetworks =
        (json['social_networks'] as List)
            .map((e) => SocialNetworkDTO.fromJson(e))
            .toList();

    return AuthorDTO(
      name: _name,
      bio: _bio,
      donationMethods: _donationMethods,
      socialNetworks: _socialNetworks,
      website: _website,
    );
  }
}
