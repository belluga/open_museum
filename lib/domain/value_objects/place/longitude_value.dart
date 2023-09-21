import 'package:open_museum/domain/value_objects/place/coordinate_value.dart';

class LongitudeValue extends CoordinateValue {
  LongitudeValue({
    required super.defaultValue,
    super.maxValue = 180,
    super.minValue = -180,
  });
}
