import 'package:stream_value/core/stream_value.dart';
import 'package:location/location.dart';

class RangeModel {
  final double defaultMaxDistance;
  LocationData? _currentPlace;
  final maxDistanceStreamValue = StreamValue<double>(defaultValue: 10);

  RangeModel({this.defaultMaxDistance = 10});

  double get maxDistance => maxDistanceStreamValue.value;

  double get _maxDistanceInGrades =>
      maxDistanceStreamValue.value.toDouble() * 0.0095;

  double get _currentLat => _currentPlace?.latitude ?? 0;
  double get _currentLong => _currentPlace?.longitude ?? 0;
  double get latMax => _currentLat + _maxDistanceInGrades;
  double get latMin => _currentLat - _maxDistanceInGrades;
  double get longMax => _currentLong + _maxDistanceInGrades;
  double get longMin => _currentLong - _maxDistanceInGrades;

  void setCurrentPlace(LocationData? newLocation) =>
      _currentPlace = newLocation;

  void setMaxDistance(double newDistance) =>
      maxDistanceStreamValue.addValue(newDistance);

  void dispose() {
    maxDistanceStreamValue.dispose();
  }
}
