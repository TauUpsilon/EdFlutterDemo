part of 'network.page.dart';

class NetworkCubit extends Cubit<NetworkState> with AlphaBase {
  final todosService = AppLocator.getIt.get<TodosApiService>();

  late CompositeSubscription _subscription = CompositeSubscription();

  NetworkCubit() : super(NetworkState.initialState());

  void requestTodos() {
    _subscription.add(
      todosService.requestTodos().listen((res) {
        emit(NetworkState.create(res));
      }),
    );
  }

  void didChangeDependencies() {
    _subscription = CompositeSubscription();
  }

  void dispose() {
    _subscription.dispose();
  }
}
