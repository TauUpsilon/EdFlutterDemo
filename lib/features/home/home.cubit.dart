part of 'home.page.dart';

class HomeCubit extends Cubit<HomeState> with CommonFunctionable {
  final _subscription = CompositeSubscription();

  HomeCubit() : super(HomeInitial.init());

  @override
  Future<void> close() async {
    await _subscription.dispose();
    await super.close();
  }

  void navigateToNetwork() {
    router.push(NetworkRoute(test: 'edward'));
  }

  void navigateToComponent() {
    router.push(ComponentRoute());
  }

  void navigateToNested() {
    router.push(NestedHomeRoute());
  }

  void navigateToSubNested() {
    router.push(SubNestedHomeRoute());
  }

  void rsaRequest() {
    GetIt.I<ApiService>()
        .request(
          LocalRequest(
            method: ApiMethod.post,
            uri: 'api/auth/request-auth',
          ),
        )
        .listen(
          _onDone,
        );
  }

  void _onDone(ApiModeller event) {
    final done = event.model as ApiDone<dynamic>;
    final pkpemStr = (done.value as Map<String, dynamic>)['pkpem'];
    final pkpemBase64 = Base64Decoder().convert(pkpemStr);
    final pkpemUtf8 = Utf8Decoder().convert(pkpemBase64).trim();
    final publicKey = rsaService.parsePublicKeyFromPem(pkpemUtf8);
    final data = Uint8List.fromList(Utf8Encoder().convert('string'));
    final dataEncrypted = rsaService.encrypt(publicKey, data);
    // final dataEncryptedBase64 = Utf8Encoder().convert(dataEncrypted);
    final dataEncryptedUtf8 = Base64Encoder().convert(dataEncrypted);

    GetIt.I<ApiService>()
        .request(
          LocalRequest(
            method: ApiMethod.post,
            uri: 'api/auth/do-auth',
            body: {
              'encryptedData': dataEncryptedUtf8,
            },
          ),
        )
        .listen(
          _onDoneTwo,
        );
  }

  void _onDoneTwo(ApiModeller event) {
    print('edward');
  }
}
