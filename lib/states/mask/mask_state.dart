part of 'mask_cubit.dart';

@immutable
sealed class MaskState with EquatableMixin {
  final MaskType type;
  final List<String> clients;
  final bool isON;
  final bool isForciblyChange;

  const MaskState({
    required this.type,
    required this.clients,
    required this.isON,
    required this.isForciblyChange,
  });

  factory MaskState.init() => const MaskInstance(
        clients: [],
        type: MaskType.loading,
        isON: false,
        isForciblyChange: false,
      );

  factory MaskState.copyWith(
    List<String> clients, {
    required MaskType type,
    bool isON = false,
    bool isForciblyChange = false,
  }) =>
      MaskInstance(
        clients: clients,
        type: type,
        isON: isON,
        isForciblyChange: isForciblyChange,
      );
}

final class MaskInstance extends MaskState {
  const MaskInstance({
    required super.clients,
    required super.type,
    required super.isON,
    required super.isForciblyChange,
  });

  @override
  List<Object?> get props => [
        super.clients,
        super.type,
        super.isON,
        super.isForciblyChange,
      ];
}
