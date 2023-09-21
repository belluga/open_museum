import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/data/repository/contracts/auth_repository_contract.dart';
import 'package:open_museum/data/repository/contracts/connect_repository_contract.dart';

class AuthRepository extends AuthRepositoryContract {
  final _connect = Inject.get<ConnectRepositoryContract>()!;

  @override
  Future<void> initUser() async {
    await _connect.initUser();
  }
}
