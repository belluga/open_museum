import 'package:location/location.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/domain/artwork/artwork_model.dart';
import 'package:open_museum/infrastructure/repository/artwork_repository.dart';
import 'package:open_museum/infrastructure/repository/location_repository.dart';
import 'package:stream_value/core/stream_value.dart';

class HomeScreenController {
  final _artworkRepository = Inject.get<ArtworkRepository>()!;
  final _locationRepository = Inject.get<LocationRepository>()!;

  StreamValue<List<ArtWorkModel>?> get artworkStreamValue =>
      _artworkRepository.itemsStreamValue;

  StreamValue<LocationData?> get locationStreamValue =>
      _locationRepository.locationDataStreamValue;

  Future<void> initLocation() async {
    await _locationRepository.init();
  }
}
