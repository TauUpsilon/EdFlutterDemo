part of 'mask_cubit.dart';

@immutable
sealed class MaskState {
  final List<String> clients;

  MaskState({required this.clients});
}

final class MaskInitial extends MaskState {
  MaskInitial.init() : super(clients: []);
  MaskInitial.copy({required super.clients});
}
