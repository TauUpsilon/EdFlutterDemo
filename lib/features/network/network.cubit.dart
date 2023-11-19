part of 'network.page.dart';

class NetworkCubit extends Cubit<NetworkState> with CommonFunctionable {
  NetworkCubit({
    required NetworkRouteArgs routeArgs,
  })  : _routeArgs = routeArgs,
        super(NetworkInitial.init());

  final NetworkRouteArgs _routeArgs;

  TodosApiService get _todosService => GetIt.I<TodosApiService>();

  final _subscription = CompositeSubscription();

  @override
  Future<void> close() async {
    logger.d('close $_routeArgs');
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
