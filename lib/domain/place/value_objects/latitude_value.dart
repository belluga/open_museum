import 'package:open_museum/domain/place/value_objects/coordinate_value.dart';

class LatitudeValue extends CoordinateValue {
  LatitudeValue({
    required super.defaultValue,
    super.maxValue = 90,
    super.minValue = -90,
  });
}
