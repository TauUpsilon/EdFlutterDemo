part of 'mask.reducer.dart';

mixin MaskAction {
  static AddMaskClientAction addMaskClient(String clientName) =>
      AddMaskClientAction(clientName: clientName);

  static PopMaskClientAction popMaskClient(String clientName) =>
      PopMaskClientAction(clientName: clientName);
}

class AddMaskClientAction with MaskAction {
  String clientName;

  AddMaskClientAction({
    required this.clientName,
  });
}

class PopMaskClientAction with MaskAction {
  String clientName;

  PopMaskClientAction({
    required this.clientName,
  });
}
