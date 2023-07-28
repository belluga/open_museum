import 'package:flutter/material.dart';
import 'package:open_museum/domain/artwork/artwork_model.dart';

class ArtworkCard extends StatelessWidget {
  final ArtWorkModel artwork;

  const ArtworkCard({super.key, required this.artwork});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://cidadegraffiti.com.br/sites/contents/pics/ercilia/cidade_graffiti-ercilia.jpg"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              artwork.nameValue.value,
                              style: Theme.of(context).textTheme.headlineSmall,
                              maxLines: 2,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              artwork.descriptionValue.value,
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 3,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
