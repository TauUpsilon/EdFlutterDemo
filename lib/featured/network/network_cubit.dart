part of 'network_view.dart';

class NetworkCubit extends Cubit<void> with CommonFuncable {
  NetworkCubit() : super(null);

  TodosService get _todosService => GetIt.I<TodosService>();

  @override
  Future<void> close() async {
    await super.close();
  }

  void requestTodos() {
    // _subscription.add(
    //   _todosService.requestTodos().listen((res) {
    //     emit(NetworkInitial.update(res));
    //   }),
    // );
  }
}
