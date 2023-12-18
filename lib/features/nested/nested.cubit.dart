part of 'nested.page.dart';

class NestedCubit extends Cubit<NestedState> with CommonFunctionable {
  NestedCubit() : super(NetworkInitial.init());

  final _subscription = CompositeSubscription();

  @override
  Future<void> close() async {
    await _subscription.dispose();
    await super.close();
  }

  void navigateToOne() {
    router.navigate(NestedOneRoute(test: 'test'));
  }

  void navigateToTwo() {
    router.navigate(NestedTwoRoute());
  }

  void navigateToSubNested() {
    router.navigate(SubNestedHomeRoute());
  }
}
