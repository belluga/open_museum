import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/application/modules/home_module.dart';
import 'package:open_museum/domain/repository/auth_repository_contract.dart';
import 'package:open_museum/domain/repository/connect_repository_contract.dart';
import 'package:open_museum/infrastructure/auth_repository.dart';

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
      ];

  @override
  List<Injector> get globalInjections => [
        Injector<ConnectRepositoryContract>(
          inject: (arguments) => connectRepository,
        ),
        Injector<AuthRepositoryContract>(
          inject: (arguments) => AuthRepository(),
        ),
      ];
}
