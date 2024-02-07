import 'package:eyr/app/app_navigator.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin CommonPresentable {
  BuildContext get _context => AppNavigator.rootKey.currentState!.context;
  // AppLocalizations get localiser => AppLocalizations.of(_context)!;
  ThemeData get themer => Theme.of(_context);
}
