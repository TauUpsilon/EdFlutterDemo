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

  NetworkState copyWith({
    List<TodosGetRes>? todos,
  }) =>
      NetworkInstance(
        todos: todos ?? this.todos,
      );

  @override
  List<Object?> get props => [
        todos,
      ];
}

final class NetworkInstance extends NetworkState {
  const NetworkInstance({required super.todos});
}
