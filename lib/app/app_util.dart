import 'package:equatable/equatable.dart';
import 'package:eyr/states/env/env_cubit.dart';
import 'package:get_it/get_it.dart';

mixin AppUtil {
  static Future<void> initialise() async {
    EquatableConfig.stringify = true;

    GetIt.I<EnvCubit>().loadEnv();

    // await Firebase.initializeApp();
    // await FirebaseMessaging.instance.requestPermission(
    //   provisional: true,
    // );
    // await FirebaseMessaging.instance.getToken().then((token) {
    //   GetIt.I<LoggingService>().t(
    //     'FCM Token: \n\n${token ?? 'FCM token not generated'}',
    //   );
    // });
  }
}
