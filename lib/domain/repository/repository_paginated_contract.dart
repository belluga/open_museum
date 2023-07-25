import 'package:stream_value/core/stream_value.dart';
import 'package:flutter/material.dart';

abstract class RepositoryPaginatedContract<T> {
  RepositoryPaginatedContract() {
    init();
  }

  final itemsStreamValue = StreamValue<List<T>?>();

  int currentPage = 0;
  int totalPages = 0;
  bool get isLastPage => currentPage == totalPages;
  int get nextPage => currentPage + 1;

  Future<void> getNextPage() async => await getPage(page: nextPage);

  @protected
  Future<void> init() async => await getPage();

  @protected
  Future<void> getPage({int page = 1}) async {
    final List<T> newItemsList = [];

    newItemsList.addAll(
      await getItemsNew(page: page),
    );

    final List<T> _itemsCache = itemsStreamValue.value ?? [];

    for (T product in newItemsList) {
      if (!_itemsCache.contains(product)) {
        _itemsCache.add(product);
      }
    }

    itemsStreamValue.addValue(_itemsCache);
  }

  @protected
  Future<List<T>> getItemsNew({int page = 1});

  T? getItemByID(String itemID);
}
