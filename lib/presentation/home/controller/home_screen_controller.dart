import 'package:location/location.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/domain/place/place_model.dart';
import 'package:open_museum/domain/range_model.dart';
import 'package:open_museum/infrastructure/repository/places_repository.dart';
import 'package:open_museum/infrastructure/repository/location_repository.dart';
import 'package:stream_value/core/stream_value.dart';

class HomeScreenController {
  final _placesRepository = Inject.get<PlacesRepository>()!;
  final _locationRepository = Inject.get<LocationRepository>()!;

  StreamValue<List<PlaceModel>?> get placesStreamValue =>
      _placesRepository.itemsStreamValue;

  StreamValue<LocationData?> get locationStreamValue =>
      _locationRepository.locationDataStreamValue;

  StreamValue<PermissionStatus?> get permissionStatusStreamValue =>
      _locationRepository.permissionStatusStreamValue;

  RangeModel get range => _placesRepository.range;

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
    await _placesRepository.init();
  }

  void setMacDistance(int? newDistance) =>
      _placesRepository.setMaxDistance(newDistance);
}
