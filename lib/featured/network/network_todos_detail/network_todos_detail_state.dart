part of 'network_todos_detail_view.dart';

@immutable
sealed class NetworkTodosDetailState with EquatableMixin {
  final TodosGetRes todo;

  const NetworkTodosDetailState({
    required this.todo,
  });

  factory NetworkTodosDetailState.init() => NetworkTodosDetailInstance(
        todo: TodosGetRes(
          userId: 0,
          id: 0,
          title: '',
          completed: false,
        ),
      );

  factory NetworkTodosDetailState.copyWith({
    required TodosGetRes todo,
  }) =>
      NetworkTodosDetailInstance(
        todo: todo,
      );
}

final class NetworkTodosDetailInstance extends NetworkTodosDetailState {
  const NetworkTodosDetailInstance({
    required super.todo,
  });

  @override
  List<Object?> get props => [
        super.todo,
      ];
}
