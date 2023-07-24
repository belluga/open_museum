abstract class ConnectRepositoryContract {
  Future<void> init() async {
    await initClient();
  }

  Future<void> initClient();
  Future<void> initUser();
}
