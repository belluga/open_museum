import 'package:location/location.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/infrastructure/repository/location_repository.dart';
import 'package:stream_value/core/stream_value.dart';

class LocationGettingController {
  LocationGettingController() {
    _locationRepository.getLocation();
  }
  final _locationRepository = Inject.get<LocationRepository>()!;
  StreamValue<LocationData?> get locationDataStreamValue =>
      _locationRepository.locationDataStreamValue;
}
