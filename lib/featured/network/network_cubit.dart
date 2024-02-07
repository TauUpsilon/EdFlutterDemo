part of 'network_view.dart';

class NetworkCubit extends Cubit<NetworkState> with CommonFuncable {
  NetworkCubit() : super(NetworkState.init());

  TodosService get _todosService => GetIt.I<TodosService>();

  void onInit() {
    onTodosRequest();
  }

  Future<void> onTodosRequest() async {
    final res = await _todosService.requestTodos();

    emit(NetworkState.copyWith(todos: res.data));
  }
}
