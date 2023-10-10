part of 'network.page.dart';

class NetworkCubit extends Cubit<NetworkState> with AlphaCore {
  final todosService = GetIt.instance.get<TodosApiService>();

  final CompositeSubscription subscription = CompositeSubscription();

  NetworkCubit() : super(NetworkState.initialState());

  void requestTodos() {
    subscription.add(
      todosService.requestTodos().listen((res) {
        emit(NetworkState.create(res));
      }),
    );
  }

  void dispose() {
    subscription.dispose();
  }
}
