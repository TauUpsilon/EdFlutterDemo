part of 'nested.page.dart';

class NestedCubit extends Cubit<NestedState> with CommonFuncable {
  NestedCubit() : super(const NetworkInitial.init());

  @override
  Future<void> close() async {
    await super.close();
  }

  Future<void> navigateToOne() async {
    router.push('/nested/nested-one');
  }

  Future<void> navigateToTwo() async {
    router.push('/nested/nested-two');
  }

  Future<void> navigateToSubNested() async {
    router.push('/nested/sub-nested');
  }
}
