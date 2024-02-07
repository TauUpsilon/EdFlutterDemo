part of 'nested.page.dart';

class NestedCubit extends Cubit<NestedState> with CommonFuncable {
  NestedCubit() : super(NetworkInitial.init());

  @override
  Future<void> close() async {
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
