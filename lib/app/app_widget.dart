import 'package:eyr/app/app_theme.dart';
import 'package:eyr/shared/mixins/common_funcable.dart';
import 'package:eyr/shared/observers/app_router_observer.dart';
import 'package:eyr/shared/widgets/app_alert/app_alert_view.dart';
import 'package:eyr/shared/widgets/app_mask/app_mask_view.dart';
import 'package:eyr/states/env/env_cubit.dart';
import 'package:eyr/states/init/init_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

part 'app_config.dart';

class App extends StatelessWidget with CommonFuncable, AppRouterObserver {
  final Locale _locale = const Locale('en');

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.I<AppMaskCubit>()),
        BlocProvider(create: (context) => GetIt.I<AppAlertCubit>()),
        BlocProvider(create: (context) => GetIt.I<InitCubit>()),
        BlocProvider(create: (context) => GetIt.I<EnvCubit>()),
      ],
      child: Stack(
        alignment: Alignment.center,
        children: [
          // App
          MaterialApp.router(
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            locale: _locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerDelegate: router.routerDelegate,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            debugShowCheckedModeBanner: false,
          ),
          // Alert
          AppAlert(
            locale: _locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          ),
          // Mask
          AppMask(
            locale: _locale,
          ),
        ],
      ),
    );
  }
}
