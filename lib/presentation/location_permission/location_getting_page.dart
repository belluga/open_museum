import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/application/modules/home_module.dart';
import 'package:open_museum/presentation/location_permission/controllers/location_getting_controller.dart';
import 'package:stream_value/core/stream_value_builder.dart';

class LocationGetting extends StatefulWidget {
  const LocationGetting({super.key});

  @override
  State<LocationGetting> createState() => _LocationGettingState();
}

class _LocationGettingState extends State<LocationGetting> {
  final _controller = Inject.get<LocationGettingController>()!;

  @override
  void initState() {
    super.initState();
    _controller.locationDataStreamValue.stream.listen(_navigateOnLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamValueBuilder<LocationData?>(
            streamValue: _controller.locationDataStreamValue,
            onNullWidget: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Buscando sua localização...",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                CircularProgressIndicator(),
              ],
            ),
            builder: (context, snapshot) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Ótimo! Já temos sua localização!",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Icon(Icons.verified)
                ],
              );
            }),
      ),
    );
  }

  Future<void> _navigateOnLocation(LocationData? location) async {
    if (location != null) {
      await Future.delayed(const Duration(seconds: 2));
      _gotoHomeNavigation();
    }
  }

  void _gotoHomeNavigation() {
    Navigator.of(context).pushReplacementNamed(HomeModule.routePaths.home);
  }
}
