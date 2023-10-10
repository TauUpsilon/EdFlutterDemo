part of 'home.page.dart';

class HomeCubit extends Cubit<HomeState> with AlphaBase {
  final CompositeSubscription subscription = CompositeSubscription();

  HomeCubit() : super(const HomeState.initialState());

  void dispose() {
    subscription.dispose();
  }

  navigateToNetwork(BuildContext context) {
    Navigator.of(context).pushNamed('/network', arguments: 'Test');
  }

  navigateToComponent(BuildContext context) {
    Navigator.of(context).pushNamed('/component');
  }
}
