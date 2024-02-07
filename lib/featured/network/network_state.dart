part of 'network_view.dart';

@immutable
sealed class NetworkState with EquatableMixin {
  final List<TodosGetRes> todos;

  const NetworkState({
    required this.todos,
  });

  factory NetworkState.init() => const NetworkInstance(
        todos: [],
      );

  factory NetworkState.copyWith({
    required List<TodosGetRes> todos,
  }) =>
      NetworkInstance(
        todos: todos,
      );
}

final class NetworkInstance extends NetworkState {
  const NetworkInstance({required super.todos});

  @override
  List<Object?> get props => [
        super.todos,
      ];
}
