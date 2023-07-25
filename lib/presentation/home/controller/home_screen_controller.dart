import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/domain/artwork/artwork_model.dart';
import 'package:open_museum/infrastructure/repository/artwork_repository.dart';
import 'package:stream_value/core/stream_value.dart';

class HomeScreenController {
  final _artworkRepository = Inject.get<ArtworkRepository>()!;

  StreamValue<List<ArtWorkModel>?> get artworkStreamValue =>
      _artworkRepository.itemsStreamValue;
}
