import 'package:flutter/material.dart';
import 'package:open_museum/application/modules/home_module.dart';
import 'package:open_museum/domain/artists/artist_model.dart';
import 'package:open_museum/domain/navigation_arguments/artist_single_arguments.dart';

class ArtistsRow extends StatefulWidget {
  final double size;
  final List<ArtistModel> artists;

  const ArtistsRow({super.key, required this.artists, this.size = 32});

  @override
  State<ArtistsRow> createState() => _ArtistsRowState();
}

class _ArtistsRowState extends State<ArtistsRow> {
  @override
  Widget build(BuildContext context) {
    String _name = widget.artists.first.aliasValue.value ??
        widget.artists.first.nameValue.value;

    if (widget.artists.length == 1) {
      return InkWell(
        onTap: () => _navigateToArtistSingle(widget.artists.first),
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  widget.artists.first.avatarValue.value.toString(),
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Icon(Icons.person),
                ),
              ),
              const SizedBox(width: 8),
              Text(_name),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      height: widget.size,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () => _navigateToArtistSingle(widget.artists[index]),
          child: ClipOval(
            child: Image.network(
              widget.artists[index].avatarValue.value.toString(),
              width: widget.size,
              height: widget.size,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Icon(
                Icons.person,
                size: widget.size,
              ),
            ),
          ),
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: widget.artists.length,
      ),
    );
  }

  void _navigateToArtistSingle(ArtistModel artist) {
    Navigator.of(context).pushNamed(HomeModule.routePaths.artistSingle,
        arguments: ArtistSingleArguments(artist: artist));
  }
}
