part of 'home.page.dart';

class HomeCubit extends Cubit<HomeState> with AlphaCore {
  final todosService = GetIt.instance.get<TodosApiService>();

  final CompositeSubscription subscription = CompositeSubscription();

  HomeCubit() : super(HomeState.initialState());

  void dispose() {
    subscription.dispose();
  }
}
