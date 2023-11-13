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
