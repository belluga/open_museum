import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:open_museum/application/configs/appwrite_constants.dart';
import 'package:open_museum/domain/repository/connect_repository_contract.dart';

class ConnectRepositoryAppwrite extends ConnectRepositoryContract {
  final Client client = Client();

  ConnectRepositoryAppwrite() {
    initClient();
  }

  @override
  Future<void> initClient() async {
    client
        .setEndpoint(AppWriteConstants.baseUrl)
        .setProject(AppWriteConstants.projectID)
        .setSelfSigned(status: true);
  }

  @override
  Future<void> initUser() async {
    final account = Account(client);
    User? user;

    try {
      user = await account.get();
    } catch (e) {
      await account.createAnonymousSession();
      user = await account.get();
    }
    print(user);
  }
}
