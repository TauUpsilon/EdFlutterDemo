part of 'home_view.dart';

class HomeCubit extends Cubit<HomeState> with CommonFuncable, HttpRestable {
  final cryptoService = GetIt.I<CryptoService>();

  HomeCubit() : super(HomeState.init());

  Future<void> onInit() async {
    final res000003 = await api000Service.api000003();

    cryptoService.currentRSAPublicKeyByte = base64.decode(
      res000003.data.pubKey,
    );

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
    router.pushNamed(
      AppRoutes.network.name,
      extra: const NetworkParam(test: 'Edward test').toExtra(),
    );
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
    final res000004 = await api000Service.api000004(
      'Hello, Backend! Hello, Backend! Hello, Backend! Hello, Backend!',
    );

    final encrypted = res000004.data.encryptedData;
    final decrypted = res000004.data.decryptedData;

    logger.d('Edward Test\n\n$encrypted\n$decrypted');
  }
}
