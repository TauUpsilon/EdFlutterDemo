part of 'home.page.dart';

class HomeCubit extends Cubit<HomeState> with AlphaBase {
  final CompositeSubscription subscription = CompositeSubscription();

  HomeCubit() : super(const HomeState.initialState());

  void dispose() {
    subscription.cancel();
  }

  navigateToNetwork(BuildContext context) {
    context.pushNamed('network', extra: 'Test');
  }

  navigateToComponent(BuildContext context) {
    context.pushNamed('component');
  }
}
