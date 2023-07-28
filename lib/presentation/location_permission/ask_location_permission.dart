import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/application/modules/location_permission_module.dart';
import 'package:open_museum/presentation/location_permission/controllers/ask_location_permission_controller.dart';

class AskLocationPermission extends StatefulWidget {
  const AskLocationPermission({super.key});

  @override
  State<AskLocationPermission> createState() => _AskLocationPermissionState();
}

class _AskLocationPermissionState extends State<AskLocationPermission> {
  final _controller = Inject.get<AskLocationPermissionController>()!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            children: [
              Expanded(
                child: Text(
                  "Nós precisamos de sua localização pra te mostrar os graffitis mais próximos. Senão não tem como usar a bagaça.",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: _getPermissionAndRedirect,
            child: const Text("Dar permissão"),
          ),
          TextButton(
              onPressed: _getPermissionAndRedirect,
              child: const Text(
                  "Já deu permissão pelas configurações? Clique aqui..."))
        ],
      )),
    );
  }

  Future<void> _getPermissionAndRedirect() async {
    final bool _isPermissionGranted = await _controller.getPermission();
    if (_isPermissionGranted) {
      _navigateToLocationGetPage();
    } else {
      if (_controller.permissionStatusStreamValue.value ==
          PermissionStatus.deniedForever) {
        _navigateToSettings();
      }
    }
  }

  Future<void> _navigateToSettings() async =>
      await AppSettings.openAppSettings(type: AppSettingsType.location);

  void _navigateToLocationGetPage() => Navigator.of(context)
      .pushReplacementNamed(LocationPermissionModule.routePaths.location);
}
