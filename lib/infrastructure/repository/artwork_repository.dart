import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/application/configs/appwrite_constants.dart';
import 'package:open_museum/domain/artwork/artwork_model.dart';
import 'package:open_museum/domain/repository/repository_paginated_appwrite_contract.dart';
import 'package:open_museum/infrastructure/repository/location_repository.dart';
import 'package:stream_value/core/stream_value.dart';

class ArtworkRepository
    extends RepositoryPaginatedAppwriteContract<ArtWorkModel> {
  ArtworkRepository() {
    _maxDistanceStreamValue.stream.listen(_listenMaxDistanceChanges);
  }

  @override
  final String collectionID = "64bb04ce52fd8bdd2f9c";

  @override
  ArtWorkModel? getItemByID(String itemID) => itemsStreamValue.value
      ?.firstWhere((element) => element.objectIDValue.value == itemID);

  @override
  Future<List<ArtWorkModel>> getItemsNew({int page = 1}) async {
    final DocumentList _documentList =
        await Databases(connect.client).listDocuments(
      databaseId: AppWriteConstants.databaseID,
      collectionId: collectionID,
      queries: [
        Query.limit(perPageDocuments),
        Query.offset(perPageDocuments * (page - 1)),
      ],
    );

    try {
      currentPage = page < totalPages ? page : totalPages;
      totalPages = (_documentList.total / perPageDocuments).ceil();

      final List<Map<String, dynamic>> _finalList =
          _documentList.documents.map((e) => e.toMap()).toList();

      final List<ArtWorkModel> _artworkItems =
          _finalList.map((e) => ArtWorkModel.fromJson(e)).toList();

      return Future.value(_artworkItems);
    } catch (e, stack) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stack);
      throw Exception("Response don't have the expected format.");
    }
  }

  final _locationRepository = Inject.get<LocationRepository>()!;

  final int _maxDistanceDefault = 10;
  double get _maxDistanceInGrades =>
      _maxDistanceStreamValue.value.toDouble() * 0.0095;
  double get _currentLat =>
      _locationRepository.locationDataStreamValue.value?.latitude ?? 0;
  double get _latMax => _currentLat + _maxDistanceInGrades;
  double get _latMin => _currentLat - _maxDistanceInGrades;

  double get _currentLong =>
      _locationRepository.locationDataStreamValue.value?.longitude ?? 0;
  double get _longMax => _currentLong + _maxDistanceInGrades;
  double get _longMin => _currentLong - _maxDistanceInGrades;

  final _maxDistanceStreamValue = StreamValue<int>(defaultValue: 10);

  void setMaxDistance(int? newDistance) =>
      _maxDistanceStreamValue.addValue(newDistance ?? _maxDistanceDefault);

  Future<void> _listenMaxDistanceChanges(int maxDistance) async =>
      await getItemsNew();

  void dispose() {
    _maxDistanceStreamValue.dispose();
  }
}
