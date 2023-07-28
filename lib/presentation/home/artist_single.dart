import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/presentation/home/controller/artist_single_controller.dart';

class ArtistSingle extends StatefulWidget {

  const ArtistSingle({super.key});

  @override
  State<ArtistSingle> createState() => _ArtistSingleState();
}

class _ArtistSingleState extends State<ArtistSingle> {
  final _controller = Inject.get<ArtistSinglecontroller>()!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Center(child: Text(_controller.artist.nameValue.value)),
    );
  }

  @override
  void dispose(){
    super.dispose();
    Inject.dispose<ArtistSinglecontroller>();
  }
}
