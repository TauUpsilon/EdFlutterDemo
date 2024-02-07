import 'package:equatable/equatable.dart';
import 'package:eyr/app/app_theme.dart';
import 'package:eyr/shared/widgets/app_mask/app_mask_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_mask_cubit.dart';
part 'app_mask_state.dart';

class AppMask extends StatelessWidget {
  final Locale? locale;

  const AppMask({
    super.key,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      locale: locale,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => _maskContainer,
    );
  }

  Widget get _maskContainer {
    return BlocBuilder<AppMaskCubit, AppMaskState>(
      builder: (context, state) => switch (state.type) {
        AppMaskType.loading => _loadingMask,
        AppMaskType.covering => _coveringMask,
      },
    );
  }

  Widget get _loadingMask {
    return BlocBuilder<AppMaskCubit, AppMaskState>(
      builder: (context, state) => Visibility(
        visible: state.clients.isNotEmpty,
        child: Container(
          color: const Color.fromARGB(166, 0, 0, 0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget get _coveringMask {
    return BlocBuilder<AppMaskCubit, AppMaskState>(
      builder: (context, state) => Visibility(
        visible: state.clients.isNotEmpty,
        child: DecoratedBox(
          decoration: BoxDecoration(
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
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Locale?>('locale', locale));
  }
}
