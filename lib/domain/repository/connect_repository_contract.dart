abstract class ConnectRepositoryContract<T> {

  T get client;

  Future<void> init() async {
    await initClient();
  }

  Future<void> initClient();
  Future<void> initUser();
}
