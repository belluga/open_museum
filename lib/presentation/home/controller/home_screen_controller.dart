import 'package:location/location.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/domain/artists/artist_model.dart';
import 'package:open_museum/domain/artwork/artwork_model.dart';
import 'package:open_museum/infrastructure/repository/artworks_repository.dart';
import 'package:open_museum/infrastructure/repository/location_repository.dart';
import 'package:stream_value/core/stream_value.dart';

class HomeScreenController {
  final _artworksRepository = Inject.get<ArtworksRepository>()!;
  final _locationRepository = Inject.get<LocationRepository>()!;

  List<ArtistModel> get artistsAll => _artworksRepository.artistsAll;

  StreamValue<List<ArtWorkModel>?> get artworksStreamValue =>
      _artworksRepository.itemsStreamValue;

  StreamValue<LocationData?> get locationStreamValue =>
      _locationRepository.locationDataStreamValue;

  StreamValue<String?> get placeStreamValue =>
      _locationRepository.placeStreamValue;

  StreamValue<PermissionStatus?> get permissionStatusStreamValue =>
      _locationRepository.permissionStatusStreamValue;

  StreamValue<int> get maxDistanceStreamValue =>
      _artworksRepository.maxDistanceStreamValue;

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
    await _artworksRepository.init();
  }

  void setMaxDistance(int newDistance) =>
      _artworksRepository.setMaxDistance(newDistance);
}
