part of 'app_mask_view.dart';

class AppMaskCubit extends Cubit<AppMaskState> {
  AppMaskCubit() : super(AppMaskState.init());

  void addMaskClient(String clientName, [AppMaskType? type]) {
    final newClients = [...state.clients];

    if (!newClients.contains(clientName)) {
      newClients.add(clientName);
    }

    emit(AppMaskState.copyWith(newClients, type ?? AppMaskType.loading));
  }

  void popMaskClient(String clientName, [AppMaskType? type]) {
    final newClients = [...state.clients];

    if (clientName != AppMaskConst.persistentClient.name &&
        newClients.contains(AppMaskConst.persistentClient.name)) {
      return;
    }

    if (newClients.contains(clientName)) {
      newClients.remove(clientName);
    }

    emit(AppMaskState.copyWith(newClients, type ?? AppMaskType.loading));
  }

  void clearAll() {
    emit(AppMaskState.init());
  }
}
