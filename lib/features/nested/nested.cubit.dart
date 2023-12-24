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
    router.push('/nested/nested-one');
  }

  void navigateToTwo() {
    router.push('/nested/nested-two');
  }

  void navigateToSubNested() {
    router.push('/nested/sub-nested');
  }
}
