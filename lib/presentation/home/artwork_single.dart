import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:masonry_grid/masonry_grid.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/application/common/artists_row.dart';
import 'package:open_museum/application/common/directions_button/directions_button.dart';
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
        title: Text(_controller.artwork.nameValue.value),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                      child: Text(_controller.artwork.descriptionValue.value)),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ArtistsRow(artists: _controller.artwork.artists))),
          SliverToBoxAdapter(
            child: MasonryGrid(
              column: _controller.artwork.photos.length > 1 ? 2 : 1,
              children: List.generate(
                _controller.artwork.photos.length,
                (i) => Image.network(
                  _controller.artwork.photos[i].value.toString(),
                  errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DirectionsButton(
            destination: Coords(
              _controller.artwork.place.latitudeValue.value,
              _controller.artwork.place.longitudeValue.value,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    Inject.dispose<ArtworkSinglecontroller>();
  }
}
