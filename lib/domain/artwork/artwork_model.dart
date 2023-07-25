import 'package:open_museum/domain/dto/artwork_dto.dart';

class ArtWorkModel {
  final String documentID;

  ArtWorkModel({
    required this.documentID,
  });

  factory ArtWorkModel.fromJson(Map<String, dynamic> json) =>
      ArtWorkModel.fromDTO(ArtworkDTO.fromJson(json));

  factory ArtWorkModel.fromDTO(ArtworkDTO dto) {
    return ArtWorkModel(
      documentID: dto.id,
    );
  }
}
