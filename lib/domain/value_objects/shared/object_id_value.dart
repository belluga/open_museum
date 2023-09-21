import 'package:value_objects/domain/value_objects/generic_string_value.dart';

class ObjectIDValue extends GenericStringValue {
  ObjectIDValue(
      {super.isRequired = true, super.maxLenght = 255, super.minLenght = 5});
}
