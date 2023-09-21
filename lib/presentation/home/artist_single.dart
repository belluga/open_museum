import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/application/controllers/home/artist_single_controller.dart';
import 'package:open_museum/presentation/home/widgets/profile_external_links.dart';

class ArtistSingle extends StatefulWidget {
  const ArtistSingle({super.key});

  @override
  State<ArtistSingle> createState() => _ArtistSingleState();
}

class _ArtistSingleState extends State<ArtistSingle> {
  final _controller = Inject.get<ArtistSinglecontroller>()!;

  @override
  Widget build(BuildContext context) {
    final String? _alias = _controller.artist.aliasValue.value;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SafeArea(
              child: Row(
                children: [
                  BackButton(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: Image.network(
                            _controller.artist.avatarValue.value.toString(),
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (_alias != null)
                          Text(
                            _alias,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        if (_alias != null)
                          Text(
                            _controller.artist.nameValue.value,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        if (_alias == null)
                          Text(_controller.artist.nameValue.value),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ProfileExternalLinks(
                      externalLinks: _controller.artist.externalLinks,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(child: Text(_controller.artist.bioValue.value)),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text("Quero incentivar o artista!"))
          ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    Inject.dispose<ArtistSinglecontroller>();
  }
}
