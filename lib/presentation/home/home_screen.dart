import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/domain/artwork/artwork_model.dart';
import 'package:open_museum/presentation/home/controller/home_screen_controller.dart';
import 'package:open_museum/presentation/home/widgets/artwork_card.dart';
import 'package:open_museum/presentation/home/widgets/max_distance_selector.dart';
import 'package:stream_value/core/stream_value_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = Inject.get<HomeScreenController>()!;

  @override
  void initState() {
    super.initState();
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                StreamValueBuilder<String>(
                  streamValue: _controller.placeStreamValue,
                  builder: (context, locationState) {
                    return Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.location_pin),
                              const SizedBox(width: 8),
                              Expanded(child: Text(locationState)),
                            ],
                          ),
                        ),
                        StreamValueBuilder<int>(
                            streamValue: _controller.maxDistanceStreamValue,
                            builder: (context, state) {
                              return MaxDistanceSelector(
                                currentValue: state.ceil(),
                                onChanged: (int? newDistance) {
                                  if (newDistance != null) {
                                    _controller.setMaxDistance(newDistance);
                                  }
                                },
                              );
                            }),
                      ],
                    );
                  },
                ),
                StreamValueBuilder<List<ArtWorkModel>>(
                  streamValue: _controller.artworksStreamValue,
                  onNullWidget: const CircularProgressIndicator(),
                  builder: (context, artworksState) {
                    if (artworksState.isEmpty) {
                      return const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text("Nenhuumm graffiti na região..."),
                            ),
                          ],
                        ),
                      );
                    }
                    return Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            artworksState.length,
                            (index) => ArtworkCard(
                              artwork: artworksState[index],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
