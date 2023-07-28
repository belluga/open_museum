import 'package:flutter/material.dart';
import 'package:open_museum/application/app_open_museum.dart';
import 'package:open_museum/infrastructure/repository/connect_repository_mongodb.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final _connectRepository = ConnectRepositoryMongoDB();

  runApp(AppOpenMuseum(
    connectRepository: _connectRepository,
  ));
}
