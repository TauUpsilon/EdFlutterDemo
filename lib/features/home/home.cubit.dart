part of 'home.page.dart';

class HomeCubit extends Cubit<HomeState> with CommonFunctionable {
  final _subscription = CompositeSubscription();

  HomeCubit() : super(HomeInitial.init());

  @override
  Future<void> close() async {
    await _subscription.dispose();
    await super.close();
  }

  void navigateToNetwork() {
    router.push(NetworkRoute(test: 'edward'));
  }

  void navigateToComponent() {
    router.navigateNamed('/component');
  }
}
