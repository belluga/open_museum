import 'package:location/location.dart';
import 'package:stream_value/core/stream_value.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class LocationRepository {
  final Location location = Location();

  final serviceEnabledStreamValue = StreamValue<bool>(defaultValue: false);
  final permissionStatusStreamValue =
      StreamValue<PermissionStatus?>(defaultValue: null);
  final locationDataStreamValue =
      StreamValue<LocationData?>(defaultValue: null);
  final placeStreamValue =
      StreamValue<String?>(defaultValue: null);

  bool get isPermissionGranted {
    final PermissionStatus? _currentStatus = permissionStatusStreamValue.value;
    switch (_currentStatus) {
      case PermissionStatus.granted:
      case PermissionStatus.grantedLimited:
        return true;
      case PermissionStatus.denied:
      case PermissionStatus.deniedForever:
      default:
        return false;
    }
  }

  Future<void> getLocation() async {
    await _enableService();
    final LocationData _locationData = await location.getLocation();

    List<geocoding.Placemark> placemarks =
        await geocoding.placemarkFromCoordinates(
            _locationData.latitude!, _locationData.longitude!);
    placeStreamValue.addValue("${placemarks.first.street}, ${placemarks.first.subLocality}");
    locationDataStreamValue.addValue(_locationData);
  }

  Future<void> hasPermission() async {
    final PermissionStatus _permissionStatus = await location.hasPermission();
    permissionStatusStreamValue.addValue(_permissionStatus);
  }

  Future<void> getPermission() async {
    await hasPermission();
    if (isPermissionGranted == false) {
      final PermissionStatus _newPermissionStatus =
          await location.requestPermission();
      permissionStatusStreamValue.addValue(_newPermissionStatus);
    }
  }

  Future<void> _enableService() async {
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    serviceEnabledStreamValue.addValue(_serviceEnabled);
  }
}
