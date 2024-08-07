part of 'mask_cubit.dart';

@immutable
sealed class MaskState with EquatableMixin {
  final MaskType type;
  final List<String> clients;
  final bool isON;

  const MaskState({
    required this.type,
    required this.clients,
    required this.isON,
  });

  factory MaskState.init() => const MaskInstance(
        clients: [],
        type: MaskType.loading,
        isON: false,
      );

  factory MaskState.copyWith(
    List<String> clients,
    MaskType type, {
    required bool isON,
  }) =>
      MaskInstance(
        clients: clients,
        type: type,
        isON: isON,
      );
}

final class MaskInstance extends MaskState {
  const MaskInstance({
    required super.clients,
    required super.type,
    required super.isON,
  });

  @override
  List<Object?> get props => [super.clients, super.type, super.isON];
}
