import 'package:open_museum/domain/donation_method/value_objects/donation_method_key_type_value.dart';
import 'package:open_museum/domain/donation_method/value_objects/donation_method_key_value.dart';
import 'package:open_museum/domain/donation_method/value_objects/donation_method_type_value.dart';

class DonationMethodModel {
  final DonationMethodTypeValue typeValue;
  final DonationMethodKeyTypeValue keyType;
  final DonationMethodKeyValue key;

  DonationMethodModel({
    required this.key,
    required this.keyType,
    required this.typeValue,
  });
}
