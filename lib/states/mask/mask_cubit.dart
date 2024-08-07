import 'package:equatable/equatable.dart';
import 'package:eyr/app/app_navigator.dart';
import 'package:eyr/states/mask/mask_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

part 'mask_state.dart';

class MaskCubit extends Cubit<MaskState> {
  MaskCubit() : super(MaskState.init()) {
    stream.listen((state) {
      if (state.clients.length > 1) return;

      final context = AppNavigator.context;

      if (state.clients.length == 1 && !state.isON) {
        switch (state.type) {
          case MaskType.loading:
            emit(
              MaskState.copyWith(
                state.clients,
                state.type,
                isON: true,
              ),
            );

            Navigator.push(
              context,
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (
                  context,
                  oAnimation,
                  sAnimation,
                ) {
                  return const FadeUpwardsPageTransitionsBuilder()
                      .buildTransitions(
                    null,
                    context,
                    oAnimation,
                    sAnimation,
                    Scaffold(
                      backgroundColor: const Color.fromARGB(200, 0, 0, 0),
                      body: Center(
                        child: LoadingAnimationWidget.halfTriangleDot(
                          color: Colors.white,
                          size: 120,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );

          case MaskType.covering:
            break;
        }
      } else if (state.clients.isEmpty && state.isON) {
        Navigator.pop(context);

        emit(
          MaskState.copyWith(
            state.clients,
            state.type,
            isON: false,
          ),
        );
      }
    });
  }

  void addMaskClient(String clientName, [MaskType? type]) {
    final newClients = [...state.clients];

    if (!newClients.contains(clientName)) {
      newClients.add(clientName);
    }

    emit(
      MaskState.copyWith(
        newClients,
        type ?? MaskType.loading,
        isON: state.isON,
      ),
    );
  }

  void popMaskClient(String clientName, [MaskType? type]) {
    final newClients = [...state.clients];

    if (clientName != MaskConst.persistentClient.name &&
        newClients.contains(MaskConst.persistentClient.name)) {
      return;
    }

    if (newClients.contains(clientName)) {
      newClients.remove(clientName);
    }

    emit(
      MaskState.copyWith(
        newClients,
        type ?? MaskType.loading,
        isON: state.isON,
      ),
    );
  }

  void clearAll() {
    emit(MaskState.init());
  }
}
