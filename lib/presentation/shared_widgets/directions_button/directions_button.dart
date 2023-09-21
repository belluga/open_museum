import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:open_museum/presentation/shared_widgets/directions_button/directions_button_modal.dart';

class DirectionsButton extends StatefulWidget {
  final Coords destination;

  const DirectionsButton({super.key, required this.destination});

  @override
  State<DirectionsButton> createState() => _DirectionsButtonState();
}

class _DirectionsButtonState extends State<DirectionsButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: _showDirections, child: const Text("Rotas"));
  }

  Future<void> _showDirections() async {
    final List<AvailableMap> _availableMaps = await MapLauncher.installedMaps;
    _showModalBottomSheet(_availableMaps);
  }

  void _showModalBottomSheet(List<AvailableMap> availableMaps) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return DirectionsButtonModal(
              availableMaps: availableMaps, destination: widget.destination);
        });
  }
}
