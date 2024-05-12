part of 'locale_cubit.dart';

@immutable
sealed class LocaleState with EquatableMixin {
  final Locale locale;

  LocaleState({
    required this.locale,
  });

  factory LocaleState.init() => LocaleInstance(
        locale: const Locale('en'),
      );

  LocaleState copyWith({
    Locale? locale,
  }) =>
      LocaleInstance(
        locale: locale ?? this.locale,
      );

  @override
  List<Object> get props => [
        locale.languageCode,
      ];
}

final class LocaleInstance extends LocaleState {
  LocaleInstance({
    required super.locale,
  });
}
