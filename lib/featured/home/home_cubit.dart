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
    final res = await GetIt.I<Api000Service>().api000003();
    final publicKey = GetIt.I<CryptoService>().loadRSAPublicKey(
      res.data.pubKey,
    );

    await GetIt.I<Api000Service>().api000004(
      base64.encode(
        GetIt.I<CryptoService>().doRSAEncryption('Edward', publicKey),
      ),
    );
  }
}
