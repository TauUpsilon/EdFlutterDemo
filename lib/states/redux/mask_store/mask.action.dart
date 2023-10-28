part of 'mask.reducer.dart';

sealed class MaskAction {
  static AddMaskClientAction addMaskClient(String clientName) =>
      AddMaskClientAction(clientName: clientName);

  static PopMaskClientAction popMaskClient(String clientName) =>
      PopMaskClientAction(clientName: clientName);
}

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
