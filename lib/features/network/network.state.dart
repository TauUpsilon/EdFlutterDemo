part of 'network.page.dart';

@immutable
class NetworkState {
  final ApiModel<List<TodosGetModel>> todos;

  const NetworkState({required this.todos});

  NetworkState.initialState()
      : todos = ApiModel(
          status: LoadingStatus.loaded,
        );

  factory NetworkState.create(
    ApiModel<List<TodosGetModel>> todos,
  ) =>
      NetworkState(todos: todos);
}
