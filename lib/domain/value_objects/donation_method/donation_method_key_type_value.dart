import 'package:open_museum/domain/enum/donation_method_key_type.dart';
import 'package:value_objects/value_object.dart';

class DonationMethodKeyTypeValue extends ValueObject<DonationMethodKeyType?> {
  DonationMethodKeyTypeValue({
    required super.defaultValue,
    super.isRequired = false,
  });

  @override
  DonationMethodKeyType? doParse(String? parseValue) {
    if (parseValue == null) {
      return defaultValue;
    }

    for (DonationMethodKeyType element in DonationMethodKeyType.values) {
      if (element.name == parseValue) {
        return element;
      }
    }

    return defaultValue;
  }
}
