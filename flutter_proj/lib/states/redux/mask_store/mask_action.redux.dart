part of 'mask_reducer.redux.dart';

sealed class MaskReduxAction {
  static AddMaskClientAction addMaskClient(String clientName) => AddMaskClientAction(clientName);
  static RemoveMaskClientAction removeMaskClient(String clientName) => RemoveMaskClientAction(clientName);
}

class AddMaskClientAction extends MaskReduxAction {
  String clientName;

  AddMaskClientAction(this.clientName);
}

class RemoveMaskClientAction extends MaskReduxAction {
  String clientName;

  RemoveMaskClientAction(this.clientName);
}
