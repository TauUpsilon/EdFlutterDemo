part of 'home_view.dart';

class HomeCubit extends Cubit<HomeState> {
  final _router = GetIt.I<GoRouter>();
  final _logger = GetIt.I<LoggingService>();
  final _cryptoService = GetIt.I<CryptoService>();
  final _api000Service = GetIt.I<Api000Service>();

  HomeCubit() : super(HomeState.init());

  Future<void> onInit() async {
    final res000003 = await _api000Service.api000003();

    _cryptoService.currentRSAPublicKeyByte = base64.decode(
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
    _router.pushNamed(
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

    // if (!AppNavigator.context.mounted) return;

    // showDialog(
    //   context: AppNavigator.context,
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
    final res000004 = await _api000Service.api000004(
      'Hello, Backend! Hello, Backend! Hello, Backend! Hello, Backend!',
    );

    final encrypted = res000004.data.encryptedData;
    final decrypted = res000004.data.decryptedData;

    _logger.d('Edward Test\n\n$encrypted\n$decrypted');
  }
}
