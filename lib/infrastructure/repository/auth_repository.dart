import 'package:appwrite/appwrite.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/domain/repository/auth_repository_contract.dart';
import 'package:open_museum/domain/repository/connect_repository_contract.dart';

class AuthRepository extends AuthRepositoryContract {
  final _connect = Inject.get<ConnectRepositoryContract<Client>>()!;

  @override
  Future<void> initUser() async {
    await _connect.initUser();
  }
}
