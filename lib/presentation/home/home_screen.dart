import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/domain/place/place_model.dart';
import 'package:open_museum/presentation/home/controller/home_screen_controller.dart';
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
      body: SafeArea(
        child: Center(
          child: StreamValueBuilder<List<PlaceModel>>(
            streamValue: _controller.placesStreamValue,
            onNullWidget: const Text("Nenhum encontrado próximo."),
            builder: (context, placesState) => Column(
              children: [
                StreamValueBuilder<LocationData?>(
                    streamValue: _controller.locationStreamValue,
                    builder: (context, locationState) {
                      return Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Text(
                                    locationState?.latitude.toString() ?? ""),
                              ),
                              Container(
                                child: Text(
                                    locationState?.longitude.toString() ?? ""),
                              ),
                              Container(
                                child: Text(
                                    locationState?.accuracy.toString() ?? ""),
                              ),
                            ],
                          ),
                          StreamValueBuilder<double>(
                              streamValue:
                                  _controller.range.maxDistanceStreamValue,
                              builder: (context, state) {
                                return MaxDistanceSelector(
                                  currentValue: state.ceil(),
                                  onChanged: _controller.setMacDistance,
                                );
                              }),
                        ],
                      );
                    }),
                Expanded(
                  child: Column(
                    children: List.generate(
                      placesState.length,
                      (index) => Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Text(placesState[index].objectIDValue.value),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
