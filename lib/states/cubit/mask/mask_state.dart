part of 'mask_cubit.dart';

@immutable
sealed class MaskState {
  final List<String> clients;

  MaskState({required this.clients});
}

final class MaskInitial extends MaskState {
  MaskInitial() : super(clients: []);
}

final class MaskUpdate extends MaskState {
  MaskUpdate({required super.clients});
}
