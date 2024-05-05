part of 'locale_cubit.dart';

@immutable
sealed class LocaleState with EquatableMixin {
  final Locale locale;
  final Localiser localiser;

  LocaleState({
    required this.locale,
    required this.localiser,
  });

  factory LocaleState.init() => LocaleInstance(
        locale: const Locale('en'),
        localiser: LocaliserEn(),
      );

  LocaleState copyWith({
    Locale? locale,
    Localiser? localiser,
  }) =>
      LocaleInstance(
        locale: locale ?? this.locale,
        localiser: localiser ?? this.localiser,
      );

  @override
  List<Object> get props => [
        locale.languageCode,
        localiser.localeName,
      ];
}

final class LocaleInstance extends LocaleState {
  LocaleInstance({
    required super.locale,
    required super.localiser,
  });
}
