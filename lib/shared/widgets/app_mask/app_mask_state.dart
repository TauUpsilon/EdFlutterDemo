part of 'app_mask_view.dart';

@immutable
sealed class AppMaskState with EquatableMixin {
  final AppMaskType type;
  final List<String> clients;

  const AppMaskState({
    required this.type,
    required this.clients,
  });

  factory AppMaskState.init() => const AppMaskInstance(
        clients: [],
        type: AppMaskType.loading,
      );
      
  factory AppMaskState.copyWith(
    List<String> clients,
    AppMaskType type,
  ) =>
      AppMaskInstance(
        clients: clients,
        type: type,
      );
}

final class AppMaskInstance extends AppMaskState {
  const AppMaskInstance({
    required super.clients,
    required super.type,
  });

  @override
  List<Object?> get props => [
        super.clients,
        super.type,
      ];
}
