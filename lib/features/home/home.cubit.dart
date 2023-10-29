part of 'home.page.dart';

class HomeCubit extends Cubit<HomeState> with AlphaBase {
  final CompositeSubscription _subscription = CompositeSubscription();

  HomeCubit() : super(const HomeState.initialState());

  @override
  Future<void> close() async {
    await _subscription.dispose();
    await super.close();
  }

  void navigateToNetwork(BuildContext context) {
    context.router.navigateNamed('/network');
  }

  void navigateToComponent(BuildContext context) {
    context.router.navigateNamed('/component');
  }
}
