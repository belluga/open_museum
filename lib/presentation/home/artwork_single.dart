import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/presentation/home/controller/artwork_single_controller.dart';

class ArtwotkSingle extends StatefulWidget {
  const ArtwotkSingle({super.key});

  @override
  State<ArtwotkSingle> createState() => _ArtwotkSingleState();
}

class _ArtwotkSingleState extends State<ArtwotkSingle> {
  final _controller = Inject.get<ArtworkSinglecontroller>()!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Center(child: Text(_controller.artwork.nameValue.value)),
    );
  }

  @override
  void dispose(){
    super.dispose();
    Inject.dispose<ArtworkSinglecontroller>();
  }
}
