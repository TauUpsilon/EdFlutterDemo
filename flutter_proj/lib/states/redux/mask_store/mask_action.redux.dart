part of 'mask_reducer.redux.dart';

sealed class MaskReduxAction {
  static AddMaskClientAction addMaskClient(String clientName) => AddMaskClientAction(clientName: clientName);
  static PopMaskClientAction popMaskClient(String clientName) => PopMaskClientAction(clientName: clientName);
}

class AddMaskClientAction extends MaskReduxAction {
  String clientName;

  AddMaskClientAction({
    required this.clientName,
  });
}

class PopMaskClientAction extends MaskReduxAction {
  String clientName;

  PopMaskClientAction({
    required this.clientName,
  });
}
