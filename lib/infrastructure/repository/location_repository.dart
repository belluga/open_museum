import 'package:location/location.dart';
import 'package:stream_value/core/stream_value.dart';

class LocationRepository {
  final Location location = Location();

  final serviceEnabledStreamValue = StreamValue<bool>(defaultValue: false);
  final permissionStatusStreamValue =
      StreamValue<PermissionStatus?>(defaultValue: null);
  final locationDataStreamValue =
      StreamValue<LocationData?>(defaultValue: null);

  Future<void> init() async {
    await _enableService();
    await _getPermission();
    await _getLocation();
  }

  Future<void> _getLocation() async {
    final LocationData _locationData = await location.getLocation();
    locationDataStreamValue.addValue(_locationData);
  }

  Future<void> _getPermission() async {
    PermissionStatus _permissionStatus = await location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await location.requestPermission();
      if (_permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    permissionStatusStreamValue.addValue(_permissionStatus);
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
