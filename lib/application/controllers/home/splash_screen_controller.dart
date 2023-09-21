import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/application/modules/location_permission_module.dart';
import 'package:open_museum/data/repository/contracts/auth_repository_contract.dart';
import 'package:open_museum/data/repository/location_repository.dart';

class SplashScreenController {
  final _authRepository = Inject.get<AuthRepositoryContract>()!;
  final _locationRepository = Inject.get<LocationRepository>()!;

  Future<void> initUser() async => _authRepository.initUser();

  Future<String> getInitialRoute() async {
    await _locationRepository.hasPermission();
    if(_locationRepository.isPermissionGranted){
      return LocationPermissionModule.routePaths.location;
    }else{
      return LocationPermissionModule.routePaths.home;
    }

  }
}
