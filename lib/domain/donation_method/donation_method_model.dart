import 'package:open_museum/domain/appwrite/value_objects/appwrite_object_id_value.dart';
import 'package:open_museum/domain/donation_method/value_objetcs/donation_method_key_type_value.dart';
import 'package:open_museum/domain/donation_method/value_objetcs/donation_method_key_value.dart';
import 'package:open_museum/domain/donation_method/value_objetcs/donation_method_type_value.dart';
import 'package:open_museum/domain/dto/donation_method_dto.dart';

class DonationMethodModel {
  final AppwriteObjectIDValue objectIDValue;
  final DonationMethodTypeValue typeValue;
  final DonationMethodKeyTypeValue keyType;
  final DonationMethodKeyValue key;

  DonationMethodModel({
    required this.key,
    required this.keyType,
    required this.objectIDValue,
    required this.typeValue,
  });

  factory DonationMethodModel.fromJson(Map<String, dynamic> json) =>
      DonationMethodModel.fromDTO(DonationMethodDTO.fromJson(json));

  factory DonationMethodModel.fromDTO(DonationMethodDTO dto) {
    final _objectIDValue = AppwriteObjectIDValue()..doParse(dto.id);
    final _typeValue = DonationMethodTypeValue(defaultValue: null)
      ..doParse(dto.type);
    final _keyTypeValue = DonationMethodKeyTypeValue(defaultValue: null)
      ..doParse(dto.keyType);
    final _keyValue = DonationMethodKeyValue()..doParse(dto.key);

    return DonationMethodModel(
      objectIDValue: _objectIDValue,
      key: _keyValue,
      keyType: _keyTypeValue,
      typeValue: _typeValue,
    );
  }
}
