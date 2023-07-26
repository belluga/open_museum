import 'package:open_museum/domain/dto/photo_dto.dart';

class PhotoModel {
  PhotoModel();

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      PhotoModel.fromDTO(PhotoDTO.fromJson(json));

  factory PhotoModel.fromDTO(PhotoDTO dto) {
    return PhotoModel();
  }
}
