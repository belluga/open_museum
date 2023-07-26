import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/application/modules/home_module.dart';
import 'package:open_museum/domain/repository/auth_repository_contract.dart';
import 'package:open_museum/domain/repository/connect_repository_contract.dart';
import 'package:open_museum/infrastructure/repository/artwork_repository.dart';
import 'package:open_museum/infrastructure/repository/auth_repository.dart';
import 'package:open_museum/infrastructure/repository/location_repository.dart';

class AppOpenMuseum extends StatelessWidget with Moduler {
  final ConnectRepositoryContract<Client> connectRepository;

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
      ];

  @override
  List<Injector> get globalInjections => [
        Injector<ConnectRepositoryContract<Client>>(
          inject: (arguments) => connectRepository,
        ),
        Injector<AuthRepositoryContract>(
          inject: (arguments) => AuthRepository(),
        ),
        Injector<ArtworkRepository>(
          inject: (arguments) => ArtworkRepository(),
        ),
        Injector<LocationRepository>(
          inject: (arguments) => LocationRepository(),
        ),
      ];
}
