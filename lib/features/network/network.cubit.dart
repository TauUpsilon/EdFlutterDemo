part of 'network.page.dart';

class NetworkCubit extends Cubit<NetworkState> with CommonFunctionable {
  NetworkCubit() : super(NetworkInitial.init());

  TodosApiService get _todosService => GetIt.I<TodosApiService>();

  final _subscription = CompositeSubscription();

  @override
  Future<void> close() async {
    await _subscription.dispose();
    await super.close();
  }

  void requestTodos() {
    _subscription.add(
      _todosService.requestTodos().listen((res) {
        emit(NetworkInitial.update(res));
      }),
    );
  }
}
