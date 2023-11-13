part of 'network.page.dart';

class NetworkCubit extends Cubit<NetworkState> with CommonFunctionable {
  TodosApiService get _todosService => GetIt.I<TodosApiService>();

  final _subscription = CompositeSubscription();

  NetworkCubit()
      : super(
          NetworkState.initialState(),
        );

  @override
  Future<void> close() async {
    await _subscription.dispose();
    await GetIt.I.resetLazySingleton<NetworkCubit>();
    await super.close();
  }

  void requestTodos() {
    _subscription.add(
      _todosService.requestTodos().listen((res) {
        emit(NetworkState.create(res));
      }),
    );
  }
}
