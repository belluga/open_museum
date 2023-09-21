import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DirectionsButtonModal extends StatelessWidget {
  final List<AvailableMap> availableMaps;
  final Coords destination;
  const DirectionsButtonModal(
      {super.key, required this.availableMaps, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).dialogBackgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Abrir rota com:"),
                IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: 80,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: availableMaps.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    itemBuilder: (context, index) => IconButton(
                      onPressed: () => availableMaps[index]
                          .showDirections(destination: destination),
                      icon: SvgPicture.asset(
                        availableMaps[index].icon,
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
