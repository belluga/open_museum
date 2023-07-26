import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/application/configs/appwrite_constants.dart';
import 'package:open_museum/domain/place/place_model.dart';
import 'package:open_museum/domain/range_model.dart';
import 'package:open_museum/domain/repository/repository_paginated_appwrite_contract.dart';
import 'package:open_museum/infrastructure/repository/location_repository.dart';

class PlacesRepository extends RepositoryPaginatedAppwriteContract<PlaceModel> {
  PlacesRepository() {
    range.maxDistanceStreamValue.stream.listen(_listenMaxDistanceChanges);
    _locationRepository.locationDataStreamValue.stream
        .listen(_listenLocationChanges);
  }

  @override
  final String collectionID = "64bb08acdf5d3362f46d";

  @override
  PlaceModel? getItemByID(String itemID) => itemsStreamValue.value
      ?.firstWhere((element) => element.objectIDValue.value == itemID);

  @override
  Future<List<PlaceModel>> getItemsNew({int page = 1}) async {
    print("getItemsNew");
    print("range.maxDistance");
    print(range.maxDistance);

    final DocumentList _documentList =
        await Databases(connect.client).listDocuments(
      databaseId: AppWriteConstants.databaseID,
      collectionId: collectionID,
      queries: [
        Query.limit(perPageDocuments),
        Query.offset(perPageDocuments * (page - 1)),

        //TODO: Query with values
      ],
    );

    try {
      currentPage = page < totalPages ? page : totalPages;
      totalPages = (_documentList.total / perPageDocuments).ceil();

      final List<Map<String, dynamic>> _finalList =
          _documentList.documents.map((e) => e.toMap()).toList();

      final List<PlaceModel> _placeItems =
          _finalList.map((e) => PlaceModel.fromJson(e)).toList();

      return Future.value(_placeItems);
    } catch (e, stack) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stack);
      throw Exception("Response don't have the expected format.");
    }
  }

  final _locationRepository = Inject.get<LocationRepository>()!;

  final range = RangeModel();

  void setMaxDistance(int? newDistance) =>
      range.setMaxDistance(newDistance!.toDouble());

  Future<void> _listenMaxDistanceChanges(double maxDistance) async =>
      await getItemsNew();

  void _listenLocationChanges(LocationData? locationData) async =>
      range.setCurrentPlace(locationData);

  void dispose() {
    range.dispose();
  }
}
