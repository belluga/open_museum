import 'package:value_objects/value_object.dart';

class ArtistAliasValue extends ValueObject<String?> {
  ArtistAliasValue({
    super.defaultValue,
    super.isRequired = false,
  });

  @override
  String? doParse(String? parseValue) => parseValue;
}
