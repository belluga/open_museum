import 'package:open_museum/data/repository/contracts/repository_paginated_contract.dart';
import 'package:stream_value/core/stream_value.dart';
import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';

abstract class ControllerPaginatedContract<
    T extends RepositoryPaginatedContract> {
  ControllerPaginatedContract() {
    listViewScrowController.addListener(_listenToScroll);
  }

  final itemRepository = Inject.get<T>()!;

  final loadingNextPageStreamValue = StreamValue<bool>(defaultValue: false);

  final listViewScrowController = ScrollController();

  Future<void> _listenToScroll() async {
    final double _offset = listViewScrowController.offset;
    final double _maxScroll = listViewScrowController.position.maxScrollExtent;

    final bool _reachMaxScroll = _offset >= _maxScroll;

    if (_reachMaxScroll && itemRepository.isLastPage == false) {
      loadingNextPageStreamValue.addValue(true);
      await itemRepository.getNextPage();
      loadingNextPageStreamValue.addValue(false);
    }
  }

  void dispose();
}
