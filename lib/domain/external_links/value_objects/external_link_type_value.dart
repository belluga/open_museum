import 'package:open_museum/domain/external_links/enum/external_link_types.dart';
import 'package:value_objects/value_object.dart';

class ExternalLinkTypeValue extends ValueObject<ExternalLinkTypes> {
  ExternalLinkTypeValue({
    super.defaultValue = ExternalLinkTypes.instagram,
    super.isRequired = true,
  });

  @override
  ExternalLinkTypes doParse(String? parseValue) {
    if (parseValue == null) {
      return defaultValue;
    }

    for (ExternalLinkTypes element in ExternalLinkTypes.values) {
      if (element.name == parseValue) {
        return element;
      }
    }

    return defaultValue;
  }
}
