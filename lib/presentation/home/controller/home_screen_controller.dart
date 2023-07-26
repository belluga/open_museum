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

  StreamValue<PermissionStatus?> get permissionStatusStreamValue =>
      _locationRepository.permissionStatusStreamValue;

  bool get permissionGranted {
    switch (permissionStatusStreamValue.value) {
      case PermissionStatus.granted:
      case PermissionStatus.grantedLimited:
        return true;
      case PermissionStatus.denied:
      case PermissionStatus.deniedForever:
      default:
        return false;
    }
  }

  Future<void> init() async {
    await initLocation();
    if (permissionGranted) {
      await initArtworks();
    }
  }

  Future<void> initLocation() async {
    await _locationRepository.init();
  }

  Future<void> initArtworks() async {
    await _artworkRepository.init();
  }

  void setMacDistance(int? newDistance) =>
      _artworkRepository.setMaxDistance(newDistance);
}
