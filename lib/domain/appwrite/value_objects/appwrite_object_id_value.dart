import 'package:value_objects/domain/value_objects/generic_string_value.dart';

class AppwriteObjectIDValue extends GenericStringValue {
  AppwriteObjectIDValue(
      {super.isRequired = true, super.maxLenght = 255, super.minLenght = 5});
}
