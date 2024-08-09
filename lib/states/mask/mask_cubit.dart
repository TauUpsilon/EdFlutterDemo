import 'package:equatable/equatable.dart';
import 'package:eyr/states/mask/mask_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

part 'mask_state.dart';

class MaskCubit extends Cubit<MaskState> {
  final BuildContext Function() getContext;

  MaskCubit({
    required this.getContext,
  }) : super(MaskState.init()) {
    stream.listen((state) {
      if (state.isON && state.isForciblyChange) {
        Navigator.pop(context);

        _putOnMask(context);

        return;
      }

      if (state.clients.length > 1) return;

      if (state.clients.length == 1 && !state.isON) {
        _putOnMask(context);

        emit(
          MaskState.copyWith(
            state.clients,
            type: state.type,
            isON: true,
          ),
        );
      } else if (state.clients.isEmpty && state.isON) {
        Navigator.pop(context);

        emit(
          MaskState.copyWith(
            state.clients,
            type: state.type,
          ),
        );
      }
    });
  }

  BuildContext get context => getContext();

  void _putOnMask(BuildContext context) {
    switch (state.type) {
      case MaskType.loading:
        Navigator.push(
          context,
          PageRouteBuilder(
            opaque: false,
            pageBuilder: _loadingPageBuilder,
          ),
        );

      case MaskType.covering:
        Navigator.push(
          context,
          PageRouteBuilder(
            opaque: false,
            pageBuilder: _coveringPageBuilder,
          ),
        );
    }
  }

  Widget _loadingPageBuilder(
    BuildContext context,
    Animation<double> oAnimation,
    Animation<double> sAnimation,
  ) {
    return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
      null,
      context,
      oAnimation,
      sAnimation,
      Scaffold(
        backgroundColor: const Color.fromARGB(235, 0, 0, 0),
        body: Center(
          child: LoadingAnimationWidget.halfTriangleDot(
            color: Colors.white,
            size: 150,
          ),
        ),
      ),
    );
  }

  Widget _coveringPageBuilder(
    BuildContext context,
    Animation<double> oAnimation,
    Animation<double> sAnimation,
  ) {
    return const FadeUpwardsPageTransitionsBuilder().buildTransitions(
      null,
      context,
      oAnimation,
      sAnimation,
      Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Center(
          child: LoadingAnimationWidget.halfTriangleDot(
            color: const Color.fromARGB(255, 0, 0, 0),
            size: 150,
          ),
        ),
      ),
    );
  }

  void addMaskClient(
    String clientName, {
    MaskType? type,
    bool isForciblyChange = false,
  }) {
    final newClients = [...state.clients];

    if (!newClients.contains(clientName)) {
      newClients.add(clientName);
    }

    emit(
      MaskState.copyWith(
        newClients,
        type: type ?? state.type,
        isON: state.isON,
        isForciblyChange: isForciblyChange,
      ),
    );
  }

  void popMaskClient(
    String clientName, {
    MaskType? type,
    bool isForciblyChange = false,
  }) {
    final newClients = [...state.clients];

    if (newClients.contains(clientName)) {
      newClients.remove(clientName);
    }

    emit(
      MaskState.copyWith(
        newClients,
        type: type ?? state.type,
        isON: state.isON,
        isForciblyChange: isForciblyChange,
      ),
    );
  }

  void clearAll() {
    emit(MaskState.init());
  }
}
