import 'package:open_museum/domain/appwrite/value_objects/appwrite_object_id_value.dart';
import 'package:open_museum/domain/artists/value_objects/artist_alias_value.dart';
import 'package:open_museum/domain/artists/value_objects/artist_avatar_value.dart';
import 'package:open_museum/domain/artists/value_objects/artist_bio_value.dart';
import 'package:open_museum/domain/artists/value_objects/artist_name_value.dart';
import 'package:open_museum/domain/donation_method/donation_method_model.dart';
import 'package:open_museum/domain/external_links/external_link_model.dart';

class ArtistModel {
  final AppwriteObjectIDValue objectIDValue;
  final ArtistNameValue nameValue;
  final ArtistAliasValue aliasValue;
  final ArtistAvatarValue avatarValue;
  final ArtistBioValue bioValue;
  final List<DonationMethodModel> donationMethods;
  final List<ExternalLinkModel> externalLinks;

  ArtistModel({
    required this.bioValue,
    required this.donationMethods,
    required this.nameValue,
    required this.aliasValue,
    required this.objectIDValue,
    required this.externalLinks,
    required this.avatarValue,
  });

  @override
  int get hashCode => Object.hashAll([objectIDValue.value]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ArtistModel) return false;
    ArtistModel otherMyClass = other;
    return otherMyClass.objectIDValue.value == objectIDValue.value;
  }
}
