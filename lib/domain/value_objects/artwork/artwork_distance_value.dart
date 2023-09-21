import 'package:value_objects/value_object.dart';

class ArtworkDistanceValue extends ValueObject<double> {
  ArtworkDistanceValue({
    required super.defaultValue,
    super.isRequired = true,
  });

  @override
  double doParse(String? parseValue) => double.parse(parseValue.toString());

  @override
  String get valueFormated => "${(value/1000).toStringAsFixed(2)} km";
}
