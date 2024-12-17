import 'package:eyr/api/eyr_spring_boot/api000/api000_service.dart';
import 'package:eyr/api/eyr_spring_boot/api001/api001_service.dart';
import 'package:eyr/apn/app/app_routes.dart';
import 'package:eyr/featured/home/classes/application.dart';
import 'package:eyr/featured/home/home_state.dart';
import 'package:eyr/shared/services/logging_service.dart';
import 'package:eyr_tools/eyr_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HomeCubit extends Cubit<HomeState> {
  final _router = GetIt.I<GoRouter>();
  final _logger = GetIt.I<LoggingService>();
  // final _cryptoService = GetIt.I<CryptoService>();
  final _api000Service = GetIt.I<Api000Service>();
  final _api001Service = GetIt.I<Api001Service>();

  List<Application> get apps => [
        Application(
          icon: Icons.settings,
          label: 'Test',
          route: AppRoutes.common.test,
        ),
      ];

  HomeCubit() : super(HomeState.init());

  Future<void> onInit() async {
    // final res000003 = await _api000Service.api000003();

    // _cryptoService.currentRSAPublicKeyByte = base64.decode(
    //   res000003.data.pubKey,
    // );

    // FirebaseMessaging.onMessage.listen((event) {
    //   emit(
    //     state.copyWith(
    //       title: event.notification?.title,
    //       body: event.notification?.body,
    //     ),
    //   );
    // });
  }

  Future<void> onApplicationClicked(Application app) async {
    _logger.d('${app.label} tapped!');
    _router.pushNamed(
      app.route.name,
      // extra: const CommonParam(test: 'Edward test').toExtra(),
    );
  }

  Future<void> onTry() async {
    final air = EyrTools.getOnTheAir().listen(_logger.w);

    await Future.delayed(Durations.extralong4 * 5);

    air.cancel();

    // await sendToDecrypt();

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
    // throw Exception('Edward Error');

    await _api001Service.api001001();

    final res000004 = await _api000Service.api000004(
      'Hello, Backend! Hello, Backend! Hello, Backend! Hello, Backend!',
    );

    final encrypted = res000004.data.encryptedData;
    final decrypted = res000004.data.decryptedData;

    _logger.d('Edward Test\n\n$encrypted\n$decrypted');
  }
}
