// import 'dart:async';

// import 'package:easy_localization/easy_localization.dart';
// import 'package:hsbc_mobile_frontend/config/tealium_config.dart';
// import 'package:hsbc_mobile_frontend/extension/go_router_extension.dart';
// import 'package:hsbc_mobile_frontend/mixins/common_funtionable.dart';
// import 'package:hsbc_mobile_frontend/routes/app_router.dart';
// import 'package:hsbc_mobile_frontend/translations/locale_keys.g.dart';
// import 'package:hsbc_mobile_frontend/views/page/common/outcome_page/outcome_view.dart';

// enum TimeoutType {
//   jwt,
//   session,
// }

// class LocalSessionService with CommonFunctionable {
//   Timer? _timer;

//   void runSessionTimer() {
//     if (authCubit.state.accessModel?.sessionId != null) {
//       _timer?.cancel();

//       _timer = Timer(
//         Duration(seconds: envCubit.state.localSessionTimeoutSec),
//         () => _handleTimeout(),
//       );
//     }
//   }

//   void cacelSessionTimer() {
//     _timer?.cancel();
//   }

//   // only for hsbcApiService.checkIfCurrentSession is false
//   Future<void> remoteSessionTimeout() async {
//     await _handleTimeout(localExpired: false);
//   }

//   Future<void> _handleTimeout({
//     bool localExpired = true,
//   }) async {
//     tealium.trackByTealiumTag([TealiumJourney.logout], '30');

//     localExpired
//         ? await authCubit.biometricLogout()
//         : await authCubit.update(
//             user: authCubit.state.user, 
//             accessModel: null
//           );

//     await router.pushNamed(
//       RouterTable.errorCommon,
//       extra: ErrorCommonRouteParam(
//         pageTitle: '',
//         canPop: false,
//         title: localExpired
//             ? LocaleKeys.loginSesstionLocalTimeoutPageTitle.tr()
//             : LocaleKeys.loginSesstionRemoteTimeoutPageTitle.tr(),
//         subtitle: localExpired
//             ? LocaleKeys.loginSesstionLocalTimeoutPageSubtitle.tr()
//             : LocaleKeys.loginSesstionRemoteTimeoutPageSubtitle.tr(),
//         button: BottomButton(
//           text: LocaleKeys.backToLogon.tr(),
//           onPressed: () => router.pushNamedAndPopUntil(
//             RouterTable.authLoginWelcome,
//           ),
//         ),
//       ),
//     );
//   }
// }
