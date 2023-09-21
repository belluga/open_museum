import 'package:flutter/material.dart';
import 'package:open_museum/presentation/shared_widgets/artists_row.dart';
import 'package:open_museum/application/modules/home_module.dart';
import 'package:open_museum/domain/entities/artwork_model.dart';
import 'package:open_museum/application/view_model/navigation_arguments/artwork_single_arguments.dart';

class ArtworkCard extends StatefulWidget {
  final ArtWorkModel artwork;

  const ArtworkCard({super.key, required this.artwork});

  @override
  State<ArtworkCard> createState() => _ArtworkCardState();
}

class _ArtworkCardState extends State<ArtworkCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _navigateToArworkSingle,
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              widget.artwork.photos.first.value.toString()),
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
                                widget.artwork.nameValue.value,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                maxLines: 2,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.artwork.descriptionValue.value,
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ArtistsRow(
                      artists: widget.artwork.artists,
                    ),
                  ),
                  Chip(
                    label: Text(widget.artwork.distanceValue.valueFormated),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToArworkSingle() {
    Navigator.of(context).pushNamed(HomeModule.routePaths.artworkSingle,
        arguments: ArtworkSingleArguments(artwork: widget.artwork));
  }
}
