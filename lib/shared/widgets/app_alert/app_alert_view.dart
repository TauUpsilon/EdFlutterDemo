import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:eyr/app/app_theme.dart';
import 'package:eyr/localised/localiser.g.dart';
import 'package:eyr/shared/widgets/app_alert/app_alert_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_alert_cubit.dart';
part 'app_alert_state.dart';

class AppAlert extends StatelessWidget {
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final GlobalKey<NavigatorState>? navigatorKey;

  const AppAlert({
    super.key,
    this.locale,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppAlertCubit, AppAlertState>(
      builder: (context, state) => Visibility(
        visible: state.status == AppAlertStatus.on,
        child: MaterialApp(
          navigatorKey: navigatorKey,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          locale: locale,
          localizationsDelegates: localizationsDelegates,
          supportedLocales: supportedLocales,
          debugShowCheckedModeBanner: false,
          builder: (context, child) => _alertContainer,
        ),
      ),
    );
  }

  Widget get _alertContainer {
    return BlocBuilder<AppAlertCubit, AppAlertState>(
      builder: (context, state) => Container(
        color: const Color.fromARGB(166, 0, 0, 0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Dialog(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.5, 1],
                colors: [
                  Theme.of(context).colorScheme.onBackground,
                  Theme.of(context).colorScheme.background,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _content,
                  const SizedBox(height: 20),
                  _bottons,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get _content {
    return BlocBuilder<AppAlertCubit, AppAlertState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Text(
          state.content,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }

  Widget get _bottons {
    return BlocBuilder<AppAlertCubit, AppAlertState>(
      builder: (context, state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            child: Text(Localiser.of(context).wordConfirm),
            onPressed: () => context.read<AppAlertCubit>().onConfirm(),
          ),
          ElevatedButton(
            child: Text(Localiser.of(context).wordCancel),
            onPressed: () => context.read<AppAlertCubit>().onCancel(),
          ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Locale?>('locale', locale))
      ..add(
        IterableProperty<LocalizationsDelegate>(
          'localizationsDelegates',
          localizationsDelegates,
        ),
      )
      ..add(IterableProperty<Locale>('supportedLocales', supportedLocales))
      ..add(
        DiagnosticsProperty<GlobalKey<NavigatorState>?>(
          'navigatorKey',
          navigatorKey,
        ),
      );
  }
}
