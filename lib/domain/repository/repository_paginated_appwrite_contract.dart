import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/domain/repository/connect_repository_contract.dart';
import 'package:open_museum/domain/repository/repository_paginated_contract.dart';

abstract class RepositoryPaginatedMongodbContract<T>
    extends RepositoryPaginatedContract<T> {

  String get collectionID;
  int get perPageDocuments => 10;
  ConnectRepositoryContract get connect =>
      Inject.get<ConnectRepositoryContract>()!;

}
