import 'package:flutter/material.dart';
import 'package:open_museum/domain/artists/artist_model.dart';

class ArtistsRow extends StatelessWidget {
  final List<ArtistModel> artists;

  const ArtistsRow({super.key, required this.artists});

  @override
  Widget build(BuildContext context) {
    String _name =
        artists.first.aliasValue.value ?? artists.first.nameValue.value;

    if (artists.length == 1) {
      return SizedBox(
        height: 80,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                artists.first.avatarValue.value.toString(),
                // errorBuilder: (_, __, ___) => Icon(Icons.person),
              ),
            ),
            const SizedBox(width: 8),
            Text(_name),
          ],
        ),
      );
    }

    return SizedBox(
      width: 160,
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CircleAvatar(
          child: Image.network(
            artists[index].avatarValue.value.toString(),
            errorBuilder: (_, __, ___) => Icon(Icons.person),
          ),
        ),
        separatorBuilder: (_, __) => SizedBox(width: 16),
        itemCount: artists.length,
      ),
    );
  }
}
