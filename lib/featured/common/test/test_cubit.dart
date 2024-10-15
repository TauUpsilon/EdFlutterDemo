import 'package:eyr/featured/common/test/test_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonTestCubit extends Cubit<CommonTestState> {
  CommonTestCubit() : super(CommonTestState.init());
  void onInit() {}
}
