part of 'init_cubit.dart';

@immutable
sealed class InitState with EquatableMixin {
  const InitState();

  factory InitState.init() => InitInstance();

  InitState copyWith() => InitInstance();

  @override
  List<Object> get props => [];
}

final class InitInstance extends InitState {}
