import 'package:open_museum/domain/appwrite/value_objects/appwrite_object_id_value.dart';
import 'package:open_museum/domain/author/value_objects/author_bio_value.dart';
import 'package:open_museum/domain/author/value_objects/author_name_value.dart';
import 'package:open_museum/domain/author/value_objects/author_website_value.dart';
import 'package:open_museum/domain/donation_method/donation_method_model.dart';
import 'package:open_museum/domain/dto/author_dto.dart';
import 'package:open_museum/domain/social_network/social_network_model.dart';

class AuthorModel {
  final AppwriteObjectIDValue objectIDValue;
  final AuthorNameValue nameValue;
  final AuthorWebsiteValue websiteValue;
  final AuthorBioValue bioValue;
  final List<DonationMethodModel> donationMethods;
  final List<SocialNetworkModel> socialNetworks;

  AuthorModel({
    required this.bioValue,
    required this.donationMethods,
    required this.nameValue,
    required this.objectIDValue,
    required this.socialNetworks,
    required this.websiteValue,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) =>
      AuthorModel.fromDTO(AuthorDTO.fromJson(json));

  factory AuthorModel.fromDTO(AuthorDTO dto) {
    final _objectIDValue = AppwriteObjectIDValue()..doParse(dto.id);
    final _nameValue = AuthorNameValue()..parse(dto.name);
    final _websiteValue = AuthorWebsiteValue()..tryParse(dto.website);
    final _bioValue = AuthorBioValue()..tryParse(dto.bio);
    final _donationMethods = dto.donationMethods
        .map((dto) => DonationMethodModel.fromDTO(dto))
        .toList();
    final _socialNetworks = dto.socialNetworks
        .map((dto) => SocialNetworkModel.fromDTO(dto))
        .toList();

    return AuthorModel(
      objectIDValue: _objectIDValue,
      bioValue: _bioValue,
      donationMethods: _donationMethods,
      nameValue: _nameValue,
      socialNetworks: _socialNetworks,
      websiteValue: _websiteValue,
    );
  }
}
