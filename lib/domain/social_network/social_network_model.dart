import 'package:open_museum/domain/dto/social_network_dto.dart';
import 'package:open_museum/domain/social_network/enum/social_network_types.dart';
import 'package:open_museum/domain/appwrite/value_objects/appwrite_object_id_value.dart';
import 'package:open_museum/domain/social_network/value_objects/social_network_type_value.dart';
import 'package:open_museum/domain/social_network/value_objects/social_network_username_value.dart';

class SocialNetworkModel {
  final AppwriteObjectIDValue objectIDValue;
  final SocialNetworkTypeValue typeValue;
  final SocialNetworkUsernameValue usernameValue;

  SocialNetworkModel({
    required this.objectIDValue,
    required this.typeValue,
    required this.usernameValue,
  });

  Uri get url {
    switch (typeValue.value) {
      case SocialNetworkTypes.facebook:
        return Uri.parse("https://facebook.com/${usernameValue.value}");
      case SocialNetworkTypes.pinterest:
        return Uri.parse("https://pinterest.com/${usernameValue.value}");
      case SocialNetworkTypes.instagram:
        return Uri.parse("https://instagram.com/${usernameValue.value}");
    }
  }

  factory SocialNetworkModel.fromJson(Map<String, dynamic> json) =>
      SocialNetworkModel.fromDTO(SocialNetworkDTO.fromJson(json));

  factory SocialNetworkModel.fromDTO(SocialNetworkDTO dto) {
    final _objectIDValue = AppwriteObjectIDValue()..doParse(dto.id);
    final _typeValue = SocialNetworkTypeValue()..doParse(dto.type);
    final _usernameValue = SocialNetworkUsernameValue()..doParse(dto.username);

    return SocialNetworkModel(
      objectIDValue: _objectIDValue,
      typeValue: _typeValue,
      usernameValue: _usernameValue,
    );
  }
}
