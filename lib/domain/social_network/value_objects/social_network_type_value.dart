import 'package:open_museum/domain/social_network/enum/social_network_types.dart';
import 'package:value_objects/value_object.dart';

class SocialNetworkTypeValue extends ValueObject<SocialNetworkTypes> {
  SocialNetworkTypeValue({
    super.defaultValue = SocialNetworkTypes.instagram,
    super.isRequired = true,
  });

  @override
  SocialNetworkTypes doParse(String? parseValue) {
    if (parseValue == null) {
      return defaultValue;
    }

    for (SocialNetworkTypes element in SocialNetworkTypes.values) {
      if (element.name == parseValue) {
        return element;
      }
    }

    return defaultValue;
  }
}
