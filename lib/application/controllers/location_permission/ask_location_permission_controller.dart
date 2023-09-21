import 'package:location/location.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/data/repository/location_repository.dart';
import 'package:stream_value/core/stream_value.dart';

class AskLocationPermissionController {
  final _locationRepository = Inject.get<LocationRepository>()!;

  StreamValue<PermissionStatus?> get permissionStatusStreamValue =>
      _locationRepository.permissionStatusStreamValue;
  bool get isPermissionGranted => _locationRepository.isPermissionGranted;
  
  Future<bool> getPermission() async {
    await _locationRepository.getPermission();
    return _locationRepository.isPermissionGranted;
  }
}
