import 'package:flutter/material.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamValueBuilder<List<ArtWorkModel>>(
          streamValue: _controller.artworkStreamValue,
          onNullWidget: const Text("Nenhum encontrado próximo."),
          builder: (context, state) => Column(
            children: List.generate(
                state.length,
                (index) => Container(
                      child: Text(state[index].documentID),
                    )),
          ),
        ),
      ),
    );
  }
}
