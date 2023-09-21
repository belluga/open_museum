
import 'package:open_museum/data/repository/contracts/connect_repository_contract.dart';

class ConnectRepositoryMongoDB extends ConnectRepositoryContract {

  ConnectRepositoryMongoDB();

  @override
  Future<void> initUser() async {
    // final account = Account(client);
    // User? user;

    // try {
    //   user = await account.get();
    // } catch (e) {
    //   await account.createAnonymousSession();
    //   user = await account.get();
    // }
    // print(user);
  }
}
