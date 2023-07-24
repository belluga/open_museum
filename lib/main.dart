import 'package:flutter/material.dart';
import 'package:open_museum/application/app_open_museum.dart';
import 'package:open_museum/infrastructure/connect_repository_appwrite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final _connectRepository = ConnectRepositoryAppwrite();

  runApp(AppOpenMuseum(
    connectRepository: _connectRepository,
  ));
}
