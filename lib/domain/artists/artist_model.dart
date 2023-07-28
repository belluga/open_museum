import 'package:open_museum/domain/appwrite/value_objects/appwrite_object_id_value.dart';
import 'package:open_museum/domain/artists/value_objects/artist_alias_value.dart';
import 'package:open_museum/domain/artists/value_objects/artist_avatar_value.dart';
import 'package:open_museum/domain/artists/value_objects/artist_bio_value.dart';
import 'package:open_museum/domain/artists/value_objects/artist_name_value.dart';
import 'package:open_museum/domain/artists/value_objects/artist_store_value.dart';
import 'package:open_museum/domain/artists/value_objects/artist_website_value.dart';
import 'package:open_museum/domain/donation_method/donation_method_model.dart';
import 'package:open_museum/domain/dto/artists_dto.dart';
import 'package:open_museum/domain/social_network/social_network_model.dart';

class ArtistModel {
  final AppwriteObjectIDValue objectIDValue;
  final ArtistNameValue nameValue;
  final ArtistAliasValue aliasValue;
  final ArtistWebsiteValue websiteValue;
  final ArtistStoreValue storeValue;
  final ArtistAvatarValue avatarValue;
  final ArtistBioValue bioValue;
  final List<DonationMethodModel> donationMethods;
  final List<SocialNetworkModel> socialNetworks;

  ArtistModel({
    required this.bioValue,
    required this.donationMethods,
    required this.nameValue,
    required this.aliasValue,
    required this.objectIDValue,
    required this.socialNetworks,
    required this.websiteValue,
    required this.storeValue,
    required this.avatarValue,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      ArtistModel.fromDTO(ArtistDTO.fromJson(json));

  factory ArtistModel.fromDTO(ArtistDTO dto) {
    final _objectIDValue = AppwriteObjectIDValue()..parse(dto.id);
    final _nameValue = ArtistNameValue()..parse(dto.name);
    final _aliasValue = ArtistAliasValue()..tryParse(dto.alias);
    final _websiteValue = ArtistWebsiteValue()..tryParse(dto.website);
    final _avatarValue = ArtistAvatarValue()..tryParse(dto.avatar);
    final _storeValue = ArtistStoreValue()..tryParse(dto.store);
    final _bioValue = ArtistBioValue()..tryParse(dto.bio);
    final _donationMethods = dto.donationMethods
        .map((dto) => DonationMethodModel.fromDTO(dto))
        .toList();
    final _socialNetworks = dto.socialNetworks
        .map((dto) => SocialNetworkModel.fromDTO(dto))
        .toList();

    return ArtistModel(
      objectIDValue: _objectIDValue,
      bioValue: _bioValue,
      donationMethods: _donationMethods,
      nameValue: _nameValue,
      aliasValue: _aliasValue,
      socialNetworks: _socialNetworks,
      websiteValue: _websiteValue,
      storeValue: _storeValue,
      avatarValue: _avatarValue
    );
  }
}
