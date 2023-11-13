// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mask_state.dart';

class MaskCubit extends Cubit<MaskState> {
  MaskCubit()
      : super(
          MaskInitial(),
        );

  void addMaskClient(String clientName) {
    if (!state.clients.contains(clientName)) {
      state.clients.add(clientName);
    }

    emit(MaskUpdate(clients: state.clients));
  }

  void popMaskClient(String clientName) {
    if (state.clients.contains(clientName)) {
      state.clients.remove(clientName);
    }

    emit(MaskUpdate(clients: state.clients));
  }
}
