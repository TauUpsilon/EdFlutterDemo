part of 'app_alert_view.dart';

@immutable
sealed class AppAlertState with EquatableMixin {
  final String content;
  final AppAlertStatus status;

  const AppAlertState({
    required this.content,
    required this.status,
  });

  factory AppAlertState.init() => const AppAlertInstance(
        content: '',
        status: AppAlertStatus.off,
      );

  factory AppAlertState.copyWith(
    String content,
    AppAlertStatus status,
  ) =>
      AppAlertInstance(
        content: content,
        status: status,
      );
}

final class AppAlertInstance extends AppAlertState {
  const AppAlertInstance({
    required super.content,
    required super.status,
  });

  @override
  List<Object?> get props => [
        super.content,
      ];
}
