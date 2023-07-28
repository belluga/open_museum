import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/presentation/location_permission/ask_location_permission.dart';
import 'package:open_museum/presentation/location_permission/controllers/ask_location_permission_controller.dart';
import 'package:open_museum/presentation/location_permission/controllers/location_getting_controller.dart';
import 'package:open_museum/presentation/location_permission/location_getting_page.dart';

class LocationPermissionModule extends Module {
  @override
  String get path => routePaths.path;

  static final routePaths = _RouteNames();

  @override
  bool get allowAnonymous => true;

  @override
  List<ModuleRoute> get routes => [
        ModuleRoute(
          path: routePaths.home,
          builder: (_) => const AskLocationPermission(),
          transitionType: RouteTransitionType.downToUp,
        ),
        ModuleRoute(
          path: routePaths.location,
          builder: (_) => const LocationGetting(),
          transitionType: RouteTransitionType.rightToLeft,
        ),
      ];

  @override
  List<Injector> get injections => [
        Injector<AskLocationPermissionController>(
          inject: (arguments) => AskLocationPermissionController(),
        ),
        Injector<LocationGettingController>(
          inject: (arguments) => LocationGettingController(),
        ),
      ];
}

class _RouteNames {
  String get path => "permission";
  String get home => path;
  String get location => "$path/location";
}
