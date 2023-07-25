import 'package:open_museum/domain/donation_method/enum/donation_method_type.dart';
import 'package:value_objects/value_object.dart';

class DonationMethodTypeValue extends ValueObject<DonationMethodType?> {
  DonationMethodTypeValue({
    required super.defaultValue,
    super.isRequired = false,
  });

  @override
  DonationMethodType? doParse(String? parseValue) {
    if (parseValue == null) {
      return defaultValue;
    }

    for (DonationMethodType element in DonationMethodType.values) {
      if (element.name == parseValue) {
        return element;
      }
    }

    return defaultValue;
  }
}
