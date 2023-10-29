part of 'mask.reducer.dart';

sealed class MaskAction {}

class AddMaskClientAction extends MaskAction {
  String clientName;

  AddMaskClientAction({
    required this.clientName,
  });
}

class PopMaskClientAction extends MaskAction {
  String clientName;

  PopMaskClientAction({
    required this.clientName,
  });
}

mixin MaskActions {
  final _globalStore = GetIt.instance.get<Store<GlobalState>>();

  void addMask(String clientName) {
    _globalStore.dispatch(
      AddMaskClientAction(clientName: clientName),
    );
  }

  void removeMask(String clientName) {
    _globalStore.dispatch(
      PopMaskClientAction(clientName: clientName),
    );
  }
}
