part of 'home.page.dart';

class HomeCubit extends Cubit<HomeState> with Alpha {
  final _subscription = CompositeSubscription();

  HomeCubit() : super(const HomeState.initialState());

  @override
  Future<void> close() async {
    await _subscription.dispose();
    await super.close();
  }

  void navigateToNetwork() {
    router.pushNamed('/network');
  }

  void navigateToComponent(BuildContext context) {
    router.navigateNamed('/component');
  }
}
