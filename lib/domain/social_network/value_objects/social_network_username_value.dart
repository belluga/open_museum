import 'package:value_objects/domain/value_objects/generic_string_value.dart';

class SocialNetworkUsernameValue extends GenericStringValue {
  SocialNetworkUsernameValue({super.isRequired = true, super.maxLenght = 255});
}
