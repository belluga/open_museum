import 'package:moduler_route/moduler_route.dart';
import 'package:open_museum/domain/repository/auth_repository_contract.dart';

class SplashScreenController {
  final _authRepository = Inject.get<AuthRepositoryContract>()!;

  Future<void> initUser() async => _authRepository.initUser();
}
