import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/presentation/home/controller/splash_screen_controller.dart';
import 'package:open_museum/presentation/home/home_screen.dart';
import 'package:open_museum/presentation/home/splash_screen.dart';

class HomeModule extends Module {
  @override
  String get path => routePaths.path;

  static final routePaths = _RouteNames();

  @override
  bool get allowAnonymous => true;

  @override
  List<ModuleRoute> get routes => [
        ModuleRoute(
          path: routePaths.home,
          builder: (_) => const HomeScreen(),
          transitionType: RouteTransitionType.downToUp,
        ),
        ModuleRoute(
          path: routePaths.splash,
          builder: (_) => const SplashScreen(),
          transitionType: RouteTransitionType.downToUp,
        ),
      ];

  @override
  List<Injector> get injections => [
        Injector<SplashScreenController>(
          inject: (arguments) => SplashScreenController(),
        ),
      ];
}

class _RouteNames {
  String get path => "home";
  String get home => path;
  String get splash => "$path/splash";
}
