part of 'home_view.dart';

class HomeCubit extends Cubit<HomeState> with CommonFuncable {
  HomeCubit() : super(HomeState.init());

  void onInit() {
    FirebaseMessaging.onMessage.listen((event) {
      emit(
        state.copyWith(
          title: event.notification?.title,
          body: event.notification?.body,
        ),
      );
    });
  }

  Future<void> onNavigateToNetwork() async {
    router.pushNamed(AppRoutes.network.name);
  }

  Future<void> onTry() async {
    await sendToDecrypt();

    // ScaffoldMessenger.of(AppNavigator.context).showSnackBar(
    //   SnackBar(
    //     backgroundColor: Colors.white,
    //     content: const Text(
    //       'content',
    //       style: TextStyle(color: Colors.black),
    //     ),
    //     behavior: SnackBarBehavior.floating,
    //     margin: EdgeInsets.only(
    //       bottom: MediaQuery.of(AppNavigator.context).size.height - 100,
    //       right: 20,
    //       left: 20,
    //     ),
    //   ),
    // );

    // showDialog(
    //   context: AppNavigator.key.currentContext!,
    //   builder: (_) => BlocProvider.value(
    //     value: this,
    //     child: DecisionDialog(
    //       content: 'Test',
    //       onConfirm: () => logger.d('onConfirm'),
    //       onCancel: () => logger.d('onCancel'),
    //     ),
    //   ),
    // );
  }

  Future<void> sendToDecrypt() async {
    final frontendKeyPair = GetIt.I<CryptoService>().genRSAKeyPair(
      seed: 'YourSeedString',
    );

    final res000003 = await GetIt.I<Api000Service>().api000003(
      base64.encode(frontendKeyPair.public),
    );

    GetIt.I<CryptoService>().setBackendPublicKeyByte(
      base64.decode(res000003.data.pubKey),
    );

    const data = '''
Hello, Backend! Hello, Backend! Hello, Backend! Hello, Backend!
Hello, Backend! Hello, Backend! Hello, Backend! Hello, Backend!
    ''';

    final key = Uint8List(16);
    final encryptedData = GetIt.I<CryptoService>().doAESEncryption(
      utf8.encode(data),
      key,
    );
    final encryptedKey = GetIt.I<CryptoService>().doRSAEncryption(
      key,
    );
    final res000004 = await GetIt.I<Api000Service>().api000004(
      base64.encode(
        Uint8List.fromList(
          [encryptedKey, encryptedData].expand((x) => x).toList(),
        ),
      ),
    );
    final decrypted = utf8.decode(
      base64.decode(res000004.data.decryptedData),
    );

    // --------
    final encryptedBytes = base64.decode(res000004.data.encryptedData);
    final resEncryptedKey = encryptedBytes.sublist(0, 256);
    final resEncryptedData = encryptedBytes.sublist(256);
    final decryptedKey = GetIt.I<CryptoService>().doRSADecryption(
      resEncryptedKey,
    );
    final encrypted = utf8.decode(
      GetIt.I<CryptoService>().doAESDecryption(
        resEncryptedData,
        decryptedKey,
      ),
    );

    logger.d('Edward Test\n\n$encrypted\n$decrypted');
  }
}
