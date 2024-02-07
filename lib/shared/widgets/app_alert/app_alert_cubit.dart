part of 'app_alert_view.dart';

class AppAlertCubit extends Cubit<AppAlertState> {
  late Completer<bool> completer;

  AppAlertCubit() : super(AppAlertState.init());

  Alert show(String? content) {
    completer = Completer();

    emit(
      AppAlertState.copyWith(
        content ?? state.content,
        AppAlertStatus.on,
      ),
    );

    return Alert(completer);
  }

  void hide() {
    emit(
      AppAlertState.init(),
    );
  }

  void onConfirm() {
    hide();
    completer.complete(true);
  }

  void onCancel() {
    hide();
    completer.complete(false);
  }
}

class Alert {
  final Completer<bool> completer;

  Alert(this.completer);

  Future<bool> dismiss() {
    return completer.future;
  }
}
