import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
sealed class CommonTestState with EquatableMixin {
  const CommonTestState();

  factory CommonTestState.init() => const CommonTestInstance();

  CommonTestState copyWith() => const CommonTestInstance();

  @override
  List<Object?> get props => [];
}

final class CommonTestInstance extends CommonTestState {
  const CommonTestInstance();
}
