import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/domain/navigation_arguments/artist_single_arguments.dart';
import 'package:open_museum/domain/navigation_arguments/artwork_single_arguments.dart';
import 'package:open_museum/presentation/home/artist_single.dart';
import 'package:open_museum/presentation/home/artwork_single.dart';
import 'package:open_museum/presentation/home/controller/artist_single_controller.dart';
import 'package:open_museum/presentation/home/controller/artwork_single_controller.dart';
import 'package:open_museum/presentation/home/controller/home_screen_controller.dart';
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
        ModuleRoute(
          path: routePaths.artworkSingle,
          builder: (_) => const ArtwotkSingle(),
          transitionType: RouteTransitionType.rightToLeft,
        ),
        ModuleRoute(
          path: routePaths.artistSingle,
          builder: (_) => const ArtistSingle(),
          transitionType: RouteTransitionType.downToUp,
        ),
      ];

  @override
  List<Injector> get injections => [
        Injector<SplashScreenController>(
          inject: (arguments) => SplashScreenController(),
        ),
        Injector<HomeScreenController>(
          inject: (arguments) => HomeScreenController(),
        ),
        Injector<ArtistSinglecontroller>(
          inject: (arguments) => ArtistSinglecontroller(
            artist: (arguments as ArtistSingleArguments).artist,
          ),
        ),
        Injector<ArtworkSinglecontroller>(
          inject: (arguments) => ArtworkSinglecontroller(
            artwork: (arguments as ArtworkSingleArguments).artwork,
          ),
        ),
      ];
}

class _RouteNames {
  String get path => "home";
  String get home => path;
  String get splash => "$path/splash";
  String get artistSingle => "$path/artist";
  String get artworkSingle => "$path/artwork";
}
