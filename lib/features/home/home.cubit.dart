part of 'home.page.dart';

class HomeCubit extends Cubit<HomeState> with AlphaBase {
  final CompositeSubscription _subscription = CompositeSubscription();

  HomeCubit() : super(const HomeState.initialState());

  @override
  Future<void> close() async {
    _subscription.dispose();

    await super.close();
  }

  navigateToNetwork(BuildContext context) {
    context.pushNamed('network', extra: 'Test');
  }

  navigateToComponent(BuildContext context) {
    context.pushNamed('component');
  }
}
