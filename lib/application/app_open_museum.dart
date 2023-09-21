import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/application/modules/home_module.dart';
import 'package:open_museum/application/modules/location_permission_module.dart';
import 'package:open_museum/data/repository/contracts/auth_repository_contract.dart';
import 'package:open_museum/data/repository/contracts/connect_repository_contract.dart';
import 'package:open_museum/data/repository/artworks_repository.dart';
import 'package:open_museum/data/repository/auth_repository.dart';
import 'package:open_museum/data/repository/location_repository.dart';

class AppOpenMuseum extends StatelessWidget with Moduler {
  final ConnectRepositoryContract connectRepository;

  AppOpenMuseum({
    super.key,
    required this.connectRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museu Aberto',
      initialRoute: initialRoute(() => HomeModule.routePaths.splash),
      onGenerateRoute: routeTo,
      onUnknownRoute: unknownRoute,
      navigatorObservers: [modulerRouteObserver],
    );
  }

  @override
  List<Module> get modules => [
        HomeModule(),
        LocationPermissionModule(),
      ];

  @override
  List<Injector> get globalInjections => [
        Injector<ConnectRepositoryContract>(
          inject: (arguments) => connectRepository,
        ),
        Injector<AuthRepositoryContract>(
          inject: (arguments) => AuthRepository(),
        ),
        Injector<ArtworksRepository>(
          inject: (arguments) => ArtworksRepository(),
        ),
        Injector<LocationRepository>(
          inject: (arguments) => LocationRepository(),
        ),
      ];
}
