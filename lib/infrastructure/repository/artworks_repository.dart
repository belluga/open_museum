import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/application/configs/mongodb_constants.dart';
import 'package:open_museum/domain/artists/artist_model.dart';
import 'package:open_museum/domain/artwork/artwork_model.dart';
import 'package:open_museum/domain/repository/repository_paginated_appwrite_contract.dart';
import 'package:open_museum/infrastructure/data/dto/artwork_dto.dart';
import 'package:open_museum/infrastructure/repository/location_repository.dart';
import 'package:open_museum/infrastructure/repository/mongodb_aggregations.dart';
import 'package:stream_value/core/stream_value.dart';
import 'package:http/http.dart' as http;

class ArtworksRepository
    extends RepositoryPaginatedMongodbContract<ArtWorkModel> {
  ArtworksRepository() {
    maxDistanceStreamValue.stream.listen(_listenMaxDistanceChanges);
  }

  List<ArtistModel> get artistsAll {
    final List<ArtWorkModel>? _artowrks = itemsStreamValue.value;
    final List<ArtistModel> _artists = [];

    if (_artowrks != null) {
      for (ArtWorkModel item in _artowrks) {
        for (ArtistModel artist in item.artists) {
          if (_artists.contains(artist) == false) {
            _artists.add(artist);
          }
        }
      }
    }

    return _artists;
  }

  @override
  final String collectionID = "64bb08acdf5d3362f46d";

  final maxDistanceStreamValue = StreamValue<int>(defaultValue: 10000);

  @override
  ArtWorkModel? getItemByID(String itemID) => itemsStreamValue.value
      ?.firstWhere((element) => element.objectIDValue.value == itemID);

  @override
  Future<List<ArtWorkModel>> getItemsNew({int page = 1}) async {
    List<Map<String, Object>> _aggregation =
        MongodbAggregations.artworksByLocation(
      latitude: _locationRepository.locationDataStreamValue.value!.latitude!,
      longitude: _locationRepository.locationDataStreamValue.value!.longitude!,
      maxDistance: maxDistanceStreamValue.value,
    );

    var url = Uri.parse("${MongodbConstants.apiURL}/artworksByLocation");
    Object _data = {
      "collection": MongodbConstants.artworksCollection,
      "database": MongodbConstants.database,
      "dataSource": "production",
      "pipeline": _aggregation
    };

    Map<String, String> _headers = {
      "api-key": MongodbConstants.apiKey,
      "Access-Control-Request-Headers": "*",
      "Content-Type": "application/json"
    };

    final http.Response response =
        await http.post(url, body: json.encode(_data), headers: _headers);

    final List<Map<String, dynamic>> _documentList =
        (jsonDecode(response.body) as List)
            .map((e) => e as Map<String, dynamic>)
            .toList();

    try {
      currentPage = page < totalPages ? page : totalPages;
      totalPages = 1;

      final List<ArtWorkModel> _placeItems =
          _documentList.map((e) => ArtworkDTO.fromJson(e).toDomain()).toList();

      return Future.value(_placeItems);
    } catch (e, stack) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stack);
      throw Exception("Response don't have the expected format.");
    }
  }

  final _locationRepository = Inject.get<LocationRepository>()!;

  void setMaxDistance(int newDistance) =>
      maxDistanceStreamValue.addValue(newDistance);

  Future<void> _listenMaxDistanceChanges(int maxDistance) async {
    itemsStreamValue.addValue(null);
    final List<ArtWorkModel> _newData = await getItemsNew();
    itemsStreamValue.addValue(_newData);
  }

  void dispose() {
    maxDistanceStreamValue.dispose();
  }
}
