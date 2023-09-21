import 'package:value_objects/domain/enums/value_exceptions_type.dart';
import 'package:value_objects/domain/exceptions/value_exceptions.dart';
import 'package:value_objects/value_object.dart';

class CoordinateValue extends ValueObject<double> {
  final double maxValue;
  final double minValue;

  CoordinateValue({
    required super.defaultValue,
    super.isRequired = true,
    required this.maxValue,
    required this.minValue,
  });

  @override
  double doParse(String? parseValue) => double.parse(parseValue!);

  @override
  String get valueFormated => value.toStringAsFixed(5);

  @override
  void validate(String? newValue) {
    late double _value;
    try {
      _value = double.parse(newValue!);
    } catch (e) {
      throw InvalidValueException(
        newValue,
        type: ValueExceptionsType.invalidValue,
        message: "$newValue is not a valid number.",
      );
    }

    if (_value > maxValue) {
      throw InvalidValueException(
        newValue,
        type: ValueExceptionsType.invalidValue,
        message: "$newValue is greater than the max value: $maxValue.",
      );
    }

    if (_value < minValue) {
      throw InvalidValueException(
        newValue,
        type: ValueExceptionsType.invalidValue,
        message: "$newValue is shorter than the min value: $minValue.",
      );
    }
  }
}
