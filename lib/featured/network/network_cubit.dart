part of 'network_view.dart';

class NetworkCubit extends Cubit<NetworkState> with CommonFuncable {
  NetworkCubit() : super(NetworkState.init());
  void onInit() {}
}
