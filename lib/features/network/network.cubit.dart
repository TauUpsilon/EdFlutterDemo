part of 'network.page.dart';

class NetworkCubit extends Cubit<NetworkState> with AlphaBase {
  final _todosService = AppLocator.getIt.get<TodosApiService>();
  final _subscription = CompositeSubscription();

  NetworkCubit() : super(NetworkState.initialState());

  @override
  Future<void> close() async {
    _subscription.dispose();

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
