import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/domain/artwork/artwork_model.dart';
import 'package:open_museum/presentation/home/controller/home_screen_controller.dart';
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
    _controller.initLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamValueBuilder<List<ArtWorkModel>>(
            streamValue: _controller.artworkStreamValue,
            onNullWidget: const Text("Nenhum encontrado próximo."),
            builder: (context, state) => Column(
              children: [
                StreamValueBuilder<LocationData?>(
                    streamValue: _controller.locationStreamValue,
                    builder: (context, state) {
                      return Column(
                        children: [
                          Container(
                            child: Text(state?.latitude.toString() ?? ""),
                          ),
                          Container(
                            child: Text(state?.longitude.toString() ?? ""),
                          ),
                          Container(
                            child: Text(state?.accuracy.toString() ?? ""),
                          ),
                        ],
                      );
                    }),
                Expanded(
                  child: Column(
                    children: List.generate(
                      state.length,
                      (index) => Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Text(state[index].objectIDValue.value),
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
